//
//  LoginVC.swift
//  VMS Employee
//
//  Created by Ronak on 30/05/18.
//  Copyright © 2018 Ecosmob. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    //var isSeller : Bool = false
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.doInitialise()
    }
    
    //MARK: - Class Functions
    private func doInitialise(){
        //Transperent Navigation Bar
        self.navigationController?.navigationBar.transparentNavigationBar()
        
        //Status Bar color
        CommonFunction.Instance.setStatusBarBackgroundColor(color: .clear)
        
        //self.btnSeller.isHidden = isSeller
    }
    
    private func isValidate() -> Bool{
        if (txtUserName.text?.isEmpty)!{
            self.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kEnterEmail), completionBlock: nil)
        }else if !(txtUserName.text?.isValidEmail)!{
            self.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kValidaEmail), completionBlock: nil)
        }else if (txtPassword.text?.isEmpty)!{
            self.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kEnterPassword), completionBlock: nil)
        }else{
            return true
        }
        return false
    }

    //MARK: - Button Actions
    @IBAction func btnLoginPressed(_ sender: UIButton) {
        if isValidate(){
            //Call Login Service
            self.callLoginService()
        }
        //self.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kEnterUserPhoneNumber), completionBlock: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.LOGINTOLOGIN{ //Login Screen
            let destVC = segue.destination as! LoginVC
        }
        else if segue.identifier == Segue.LOGINTOSIGNUP{ //Signup Screen
            let destVC = segue.destination as! SignUPVC
        }
        else if segue.identifier == Segue.LOGINTOFORGOT{ //Forgot Screen
            let destVC = segue.destination as! ForgotVC
        }
    }
    
}

extension LoginVC : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.utf16.count + string.utf16.count - range.length
        //Not Allowed Special Chracter
        if textField == txtUserName{
            let characterSetAlpha = CharacterSet.letters
            let characterSetNumber = CharacterSet.alphanumerics
            if (string.rangeOfCharacter(from: characterSetAlpha.inverted) != nil && string.rangeOfCharacter(from: characterSetNumber.inverted) != nil){
                return false
            }
            return newLength <= 25
        }
        if textField == txtPassword {
            return newLength <= 25
        }
        return true
    }
}

//WebService
extension LoginVC {
    func callLoginService(){
        
        let param : [String : Any] = [
            APIKeys.tag         :  APIKeys.tagUserLogin,
            APIKeys.token       :  APIKeys.kTokenValue,
            APIKeys.email       :  txtUserName.text!,
            APIKeys.password    :  txtPassword.text!,
            APIKeys.deviceToken :  USERDEFAULTS.loadCustomObject(UDKeys.DeviceToken) ?? "12345",
            APIKeys.deviceId    :  UIDevice.current.identifierForVendor?.uuidString ?? "00000",
        ]
        let strURL = WebAPI.sellLogin 
        WebServiceHelper.postWebServiceCall(strURL, params: param, isShowLoader: true, success: { (resJSON) in
            if CommonFunction.Instance.isCodeSuccess(jsonResp: resJSON){
                if resJSON[APIKeys.flag].intValue == 100 {  //added for inserting invalid id and password get success and retune success code
                    self.showAlertWithCompletion(pTitle: "", pStrMessage: resJSON[APIKeys.message].stringValue, completionBlock: nil)
                } else {
                    let objUser = User(json: resJSON[APIKeys.data])
                    objUser.isFirstTimeHomeScreen = true
                    
                    //Save in UserDefaults
                    objUser.saveUser(objUser: objUser)
                    LOGINUSER = USERDEFAULTS.loadCustomObject(UDKeys.UserProfile) as! User
                    APPDELEGATE.handleAppViewControllerFlow()
                    
                    //Display message for succesfully login
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                        self.showAlertWithCompletion(pTitle: "", pStrMessage: resJSON[APIKeys.message].stringValue, completionBlock: nil)
                    })
                }
            }else{
                self.showAlertWithCompletion(pTitle: "", pStrMessage: resJSON[APIKeys.message].stringValue, completionBlock: nil)
            }
        }) { (resError) in
            //ERROR
        }
        
    }
}
