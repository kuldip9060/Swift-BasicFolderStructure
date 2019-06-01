//
//  ForgotVC.swift
//  VMS Employee
//
//  Created by Ronak on 31/05/18.
//  Copyright © 2018 Ecosmob. All rights reserved.
//

import UIKit

class ForgotVC: UIViewController {
    
    var isSeller : Bool!

    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Class Functions
    private func isValidate() -> Bool{
        if (txtEmail.text?.isEmpty)!{
            self.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kEnterEmail), completionBlock: nil)
        }else if !(txtEmail.text?.isValidEmail)!{
            self.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kValidaEmail), completionBlock: nil)
        }
        else{
            return true
        }
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Button Actions
    @IBAction func btnForgotPressed(_ sender: UIButton) {
        if isValidate(){
            
            self.callForgotService()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - WebService Calling
extension ForgotVC {
    
    func callForgotService(){
        
        let param : [String : Any] = [
            APIKeys.tag         :  isSeller ? APIKeys.tagSellerForgotPassword : APIKeys.tagForgotPassword,
            APIKeys.token      :  APIKeys.kTokenValue,
            APIKeys.email       :  txtEmail.text!,
            ]
        let requestURL = isSeller ? WebAPI.sellForgot : WebAPI.forgot
        WebServiceHelper.postWebServiceCall(requestURL, params: param, isShowLoader: true, success: { (resJSON) in
            if CommonFunction.Instance.isCodeSuccess(jsonResp: resJSON){
                
                self.showAlertWithCompletion(pTitle: "", pStrMessage: resJSON[APIKeys.message].stringValue, completionBlock: { (index) in
                    self.navigationController?.popToRootViewController(animated: true)
                })
                //Display message for succesfully login
                /*DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    self.showAlertWithCompletion(pTitle: "", pStrMessage: resJSON[APIKeys.message].stringValue, bstyle: .success)
                })*/
            }else{
                self.showAlertWithCompletion(pTitle: "", pStrMessage: resJSON[APIKeys.message].stringValue, completionBlock: nil)
            }
        }) { (resError) in
            //ERROR
        }
        
    }
}
