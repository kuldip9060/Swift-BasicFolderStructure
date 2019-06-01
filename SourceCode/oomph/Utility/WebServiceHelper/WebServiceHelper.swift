//
//  WebServiceHelper.swift
//  PsychScribe
//
//  Created by Ashish Kakkad on 7/27/16.
//  Copyright © 2015 MoveoApps. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

//Check Network Rechability
class Connectivity
{
    class func isConnectedToInternet() ->Bool
    {
        return NetworkReachabilityManager()!.isReachable
    }
}

class WebServiceHelper: NSObject
{
    typealias SuccessHandler = (JSON) -> Void
    typealias FailureHandler = (Error) -> Void
    
    // MARK: - Helper Methods
    /*
    class func getWebServiceCall(_ strURL : String, isShowLoader : Bool, success : @escaping SuccessHandler, failure : @escaping FailureHandler){
        
        if Connectivity.isConnectedToInternet(){
            
            if isShowLoader {  CommonFunction.Instance.displayProgressBar()  }
            print("REQUEST: ",strURL)
            
            Alamofire.request(strURL).responseJSON { (resObj) -> Void in
                print("RESPONSE: ",resObj)
                if resObj.result.isSuccess {
                    let resJson = JSON(resObj.result.value!)
                    if isShowLoader {  CommonFunction.Instance.hideProgressBar()  }
                    success(resJson)
                }
                if resObj.result.isFailure {
                    let error : Error = resObj.result.error!
                    print("ERROR: ",error.localizedDescription)
                    if isShowLoader {  CommonFunction.Instance.hideProgressBar()  }
                    self.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kDefaultErrorMessage), completionBlock: nil)
                    failure(error)
                }
            }
        }else{
            
            //Here Display Alert for No Internect
            self.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kDefaultNoInternetMessage), completionBlock: nil)
        }
    }*/
    
    class func getWebServiceCall(_ strURL : String, params : [String : Any]? = nil, headerPrm : [String : String]? = nil, isShowLoader : Bool, success : @escaping SuccessHandler, failure : @escaping FailureHandler){
        
        if Connectivity.isConnectedToInternet(){
            if isShowLoader {  CommonFunction.Instance.displayProgressBar()  }
            
            //header
            var header : [String : String] = [
                APIKeys.kAuthorization  : APIKeys.kAuthorizationValue

            ]
            if let prm = headerPrm{
                prm.forEach { (k,v) in header[k] = v }
            }
            
            print("REQUEST: ",strURL)
            print("\nHEADER: ",header)
            print("\nParameters: ",params ?? "")

            Alamofire.request(strURL, parameters: params, encoding: URLEncoding.default, headers: header).responseJSON { (resObj) -> Void in
                
                if resObj.result.isSuccess {
                    let resJson = JSON(resObj.result.value!)
                     print("RESPONSE: ",resJson)
                    if isShowLoader {  CommonFunction.Instance.hideProgressBar()  }
                    success(resJson)
                }
                if resObj.result.isFailure {
                    let error : Error = resObj.result.error!
                    print("ERROR: ",error.localizedDescription)
                    if isShowLoader {  CommonFunction.Instance.hideProgressBar()  }
                    if let topVC = UIApplication.topViewController(){
                        topVC.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kDefaultErrorMessage), completionBlock: nil)
                    }
                    failure(error)
                }
            }
        }else{
            
            //Here Display Alert for No Internect
            if let topVC = UIApplication.topViewController(){
                topVC.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kDefaultNoInternetMessage), completionBlock: nil)
            }
        }
    }
    
    class func postWebServiceCall(_ strURL : String, params : [String : Any]?,headerPrm : [String : String]? = nil,method : HTTPMethod? = .post, isShowLoader : Bool, success : @escaping SuccessHandler, failure : @escaping FailureHandler)
    {
        if Connectivity.isConnectedToInternet(){
            if isShowLoader {  CommonFunction.Instance.displayProgressBar()  }
            
            //header
            var header : [String : String] = [
                APIKeys.kAuthorization  : APIKeys.kAuthorizationValue,
            ]
            if let prm = headerPrm{
                prm.forEach { (k,v) in header[k] = v }
            }
            
            //Param
            var newParam : [String : Any] = [
                APIKeys.kKey  : APIKeys.kKeyValue,
                //APIKeys.token :  APIKeys.kTokenValue
            ]
            if let aParam = params{
                newParam.merge(dict: aParam)
            }
            
            print("REQUEST: ",strURL)
            print("\nHEADER: ",header)
            print("\nParameters: ",newParam ?? "")
            
            Alamofire.request(strURL, method: method!, parameters: newParam, encoding: URLEncoding.default, headers: header).responseJSON { (resObj) -> Void in
                
                print(resObj)
                
                if resObj.result.isSuccess
                {
                    let resJson = JSON(resObj.result.value!)
                    //print("RESPONSE: ",resJson)
                    if isShowLoader {  CommonFunction.Instance.hideProgressBar()  }
                    success(resJson)
                }
                
                if resObj.result.isFailure
                {
                    let error : Error = resObj.result.error!
                    print("ERROR: ",error.localizedDescription)
                    if isShowLoader {  CommonFunction.Instance.hideProgressBar()  }
                    if let topVC = UIApplication.topViewController(){
                        topVC.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kDefaultErrorMessage), completionBlock: nil)
                    }
                    failure(error)
                }
            }
        }else{
            
            //Here Display Alert for No Internect
            if let topVC = UIApplication.topViewController(){
                topVC.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kDefaultNoInternetMessage), completionBlock: nil)
            }
        }
    }
    
    class func postWebServiceCallWithImage(_ strURL : String, image : UIImage?, strImageParam : String, params : [String : Any]?, isShowLoader : Bool, success : @escaping SuccessHandler, failure : @escaping FailureHandler) {
        
        if Connectivity.isConnectedToInternet(){
            if isShowLoader {  CommonFunction.Instance.displayProgressBar()  }
            
            //header
            let header : [String : String] = [
                APIKeys.kAuthorization  : APIKeys.kAuthorizationValue
            ]
            var newParam : [String : Any] = [
                APIKeys.kKey  : APIKeys.kKeyValue,
                //APIKeys.token :  APIKeys.kTokenValue
            ]
            if let aParam = params{
                newParam.merge(dict: aParam)
            }
            
            print("REQUEST: ",strURL)
            print("\nHEADER: ",header)
            print("\nParameters: ",params ?? "")
            
            Alamofire.upload(
                multipartFormData: { multipartFormData in
                    guard let tempImage = image else { return }
                    if let imageData = tempImage.jpegData(compressionQuality: 0.5) {
                        //  multipartFormData.append(imageData, withName: NSDate.timeIntervalSinceReferenceDate().description+".jpg")
                        multipartFormData.append(imageData, withName:strImageParam , fileName: NSDate.timeIntervalSinceReferenceDate.description+".jpg", mimeType: "image/jpg")
                    }
                    
                    for (key, value) in newParam {
                        let data = value as! String
                        multipartFormData.append(data.data(using: String.Encoding.utf8)!, withName: key)
                        print(multipartFormData)
                    }
            },
                to: strURL,
                headers : header,
                encodingCompletion: { encodingResult in
                    
                    
                    switch encodingResult {
                    case .success(let upload, _, _):
                        
                        //Uploading Progress
                        upload.uploadProgress(closure: { (progress) in
                            //Print progress
                        })
                        
                        //uploded Response
                        upload.responseJSON { (response) -> Void in
                            
                            if response.result.isSuccess
                            {
                                let resJson = JSON(response.result.value!)
                                //print("RESPONSE: ",resJson)
                                if isShowLoader {  CommonFunction.Instance.hideProgressBar()  }
                                success(resJson)
                            }
                            
                            if response.result.isFailure
                            {
                                let error : Error = response.result.error! as Error
                                if isShowLoader {  CommonFunction.Instance.hideProgressBar()  }
                                if let topVC = UIApplication.topViewController(){
                                    topVC.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kDefaultErrorMessage), completionBlock: nil)
                                }
                                failure(error)
                            }
                            
                        }
                    case .failure(let encodingError):
                        if isShowLoader {  CommonFunction.Instance.hideProgressBar()  }
                        let error : NSError = encodingError as NSError
                        failure(error)
                        if let topVC = UIApplication.topViewController(){
                            topVC.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kDefaultErrorMessage), completionBlock: nil)
                        }
                    }
            }
            )
        }else{
            
            //Here Display Alert for No Internect
            if let topVC = UIApplication.topViewController(){
                topVC.showAlertWithCompletion(pTitle: "", pStrMessage: Localized(LocaleKey.kDefaultNoInternetMessage), completionBlock: nil)
            }
        }
    }
    
    
}

extension Dictionary {
    mutating func merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}
