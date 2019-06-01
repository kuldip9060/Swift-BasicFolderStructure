//
//  ProfileVC.swift
//  KrishiSanchar
//
//  Created by Appuno Solutions on 22/04/19.
//  Copyright © 2019 Ecosmob. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnSubmit: ShadowButton!
    
    var profileModal: ProfileModal?
    var userModal: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callProfileGetService()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ProfileVC {
    func callProfileGetService() {
        let param : [String : Any] = [
            APIKeys.tag     : APIKeys.tagProfile,
            APIKeys.key     : APIKeys.kKeyValue,
            APIKeys.token   : APIKeys.kTokenValue,
            APIKeys.user_id : User.loadLoggedInUser().customerId ?? ""
        ]
        
        WebServiceHelper.postWebServiceCall(WebAPI.profile, params: param, isShowLoader: true, success: { (resJSON) in
            if CommonFunction.Instance.isCodeSuccess(jsonResp: resJSON) {
                let objProfile = ProfileModal(json: resJSON[APIKeys.data]) 
                debugPrint("JSON:- " , objProfile)
                self.txtFirstName.text = objProfile.firstname
                self.txtLastName.text = objProfile.lastname
                self.txtMobile.text = objProfile.telephone
                self.txtEmail.text = objProfile.email
            } else {
                self.showAlertWithCompletion(pTitle: "", pStrMessage: resJSON[APIKeys.message].stringValue, completionBlock: nil)
            }
        }) { (resError) in
            
        }
        
        
    }
}
