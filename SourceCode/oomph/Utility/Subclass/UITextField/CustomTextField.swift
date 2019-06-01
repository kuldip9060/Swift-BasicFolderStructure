//
//  CustomTextField.swift
//  VMS Employee
//
//  Created by Ronak on 30/05/18.
//  Copyright © 2018 Ecosmob. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
     */
    var isImage : Bool = false
    override var tintColor: UIColor! {
        
        didSet {
            setNeedsDisplay()
        }
    }
    override func draw(_ rect: CGRect) {
        
        let startingPoint   = CGPoint(x: rect.minX, y: rect.maxY)
        let endingPoint     = CGPoint(x: rect.maxX, y: rect.maxY)
        
        let path = UIBezierPath()
        
        path.move(to: startingPoint)
        path.addLine(to: endingPoint)
        path.lineWidth = 2.0
        
        
        tintColor.setStroke()
        
        path.stroke()
    }
  /* @IBInspectable
    dynamic open var leftIconImage : UIImage? = nil {
        didSet{
            if let icon = leftIconImage{
                self.AddImage(image: icon)
            }
        }
    }*/
    
    
    @IBInspectable
    var leftImage : UIImage?{
        get {
            if self.leftImage != nil {
                
                return self.leftImage
            }
            
            return nil
        }
        set {
            isImage = newValue != nil
            if let img = newValue {
                self.AddLeftImage(image: img)
            }
        }
    }
    
    @IBInspectable
    var rightImage : UIImage?{
        get {
            if self.rightImage != nil {
                return self.rightImage
            }
            return nil
        }
        set {
            if let img = newValue {
                self.AddRightImage(image: img)
            }
        }
    }
    
    //Add Image
    func AddLeftImage(image : UIImage)
    {
        let leadingPadding = 10
        let trailingPadding = 5
        let size = 20
        
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+leadingPadding+trailingPadding, height: size) )
        let iconView  = UIImageView(frame: CGRect(x: leadingPadding, y: 0, width: size, height: size))
        iconView.image = image
        iconView.contentMode = .scaleAspectFit
        outerView.addSubview(iconView)
        
        //leftView = outerView
        //leftViewMode = .always
        self.leftView = outerView
        self.leftViewMode = .always
    }
    
    func AddRightImage(image : UIImage)
    {
        let leadingPadding = 10
        let trailingPadding = 5
        let size = 15
        
        let imgWidth = (size+leadingPadding)
        
        let aleftView = UIView(frame: CGRect(x: 0, y: 0, width: leadingPadding, height: size))
        let outerView = UIView(frame: CGRect(x: (Int(self.frame.width-CGFloat(imgWidth))), y: 0, width: size+leadingPadding+trailingPadding, height: size) )
        let iconView  = UIImageView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        iconView.image = image
        iconView.contentMode = .scaleAspectFit
        outerView.addSubview(iconView)
        iconView.isUserInteractionEnabled = true
        outerView.isUserInteractionEnabled = false
        
        leftView = aleftView
        rightView = outerView
        rightViewMode = .always
        leftViewMode = .always
    }
    
    let defaultPadding = 5
    let imgPadding = 40
    var padding = UIEdgeInsets(top: 3, left: 5, bottom: 0, right: 5)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        padding.left = CGFloat(isImage ? imgPadding : defaultPadding)
        return bounds.inset(by: padding)//UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        padding.left = CGFloat(isImage ? imgPadding : defaultPadding)
        return bounds.inset(by: padding)//UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        padding.left = CGFloat(isImage ? imgPadding : defaultPadding)
        return bounds.inset(by: padding)//UIEdgeInsetsInsetRect(bounds, padding)
    }
    

}
