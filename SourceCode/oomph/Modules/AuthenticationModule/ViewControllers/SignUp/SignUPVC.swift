//
//  SignUPVC.swift
//  KrishiSanchar
//
//  Created by Appuno Solutions on 15/04/19.
//  Copyright © 2019 Ecosmob. All rights reserved.
//

import UIKit

class SignUPVC: UIViewController {
    
    var isSeller : Bool!
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet var btnsGender: [UIButton]!
    @IBOutlet var btnsStatus: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.doInitialise()
    }
    
    //MARK: - Class Functions
    private func doInitialise(){
        //txtShopName.isHidden = !isSeller
    }
    
    private func isValidate() -> Bool{
        if (txtName.text?.isEmpty)!{
            self.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kEnterFirstName), completionBlock: nil)
        }else if (txtEmail.text?.isEmpty)!{
            self.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kEnterEmail), completionBlock: nil)
        }else if !(txtEmail.text?.isValidEmail)!{
            self.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kValidaEmail), completionBlock: nil)
        }/*else if (txtPassword.text?.isEmpty)!{
            self.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kEnterPassword), completionBlock: nil)
        }else if !(txtPassword.text?.isValidaSimplePassword)!{
            self.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kValidPassword), completionBlock: nil)
        }else if (txtConfPassword.text?.isEmpty)!{
            self.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kEnterConfirmPassword), completionBlock: nil)
        }else if (txtPassword.text != txtConfPassword.text){
            self.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kPassAndConfPassNotMatch), completionBlock: nil)
        }*/
        else{
            return true
        }
        return false
    }
    
    //MARK: - Button Actions
    @IBAction func btnGenderPressed(_ sender: UIButton) {
        btnsGender.forEach{$0.isSelected = false}
        sender.isSelected = true
    }
    @IBAction func btnStatusPressed(_ sender: UIButton) {
        btnsStatus.forEach{$0.isSelected = false}
        sender.isSelected = true
    }
    @IBAction func btnProfilePressed(_ sender: UIButton) {
        
    }
    @IBAction func btnNextPressed(_ sender: UIButton) {
        if isValidate(){
            //Call Login Service
            self.callSignUpService()
        }
        //self.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kEnterUserPhoneNumber), completionBlock: nil)
    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}

//MARK: - Call SignUP service
extension SignUPVC {
    
    func callSignUpService(){
        
        var param : [String : Any] = [
            APIKeys.tag         :  self.isSeller ? APIKeys.tagSellerRegistration : APIKeys.tagUserRegistration,
            APIKeys.token       :  APIKeys.kTokenValue,
            
            APIKeys.email       :  txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines),
 //           APIKeys.password    :  txtPassword.text!,
            APIKeys.deviceToken :  USERDEFAULTS.loadCustomObject(UDKeys.DeviceToken) ?? "12345",
            APIKeys.deviceId    :  UIDevice.current.identifierForVendor?.uuidString ?? "00000",
        ]
        
        let requestURL = self.isSeller ? WebAPI.sellRegister : WebAPI.register
        WebServiceHelper.postWebServiceCall(requestURL, params: param, isShowLoader: true, success: { (resJSON) in
            if CommonFunction.Instance.isCodeSuccess(jsonResp: resJSON){
                let objUser = User(json: resJSON[APIKeys.data])
                
                //Save in UserDefaults
                objUser.saveUser(objUser: objUser)
                
                APPDELEGATE.handleAppViewControllerFlow()
                
                //Display message for succesfully login
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    self.showAlertWithCompletion(pTitle: "", pStrMessage: resJSON[APIKeys.message].stringValue, completionBlock: nil)
                })
            }else{
                self.showAlertWithCompletion(pTitle: "", pStrMessage: resJSON[APIKeys.message].stringValue, completionBlock: nil)
            }
        }) { (resError) in
            //ERROR
        }
    }
}
