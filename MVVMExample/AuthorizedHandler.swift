//
//  AuthorizedHandler.swift
//  IDMValidate
//
//  Created by Administrator on 20/12/18.
//  Copyright © 2018 TMFC. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthorizedHandler
{
   
    func countrequestWith( parameters: [String : Any], onCompletion: ((JSON?, String) -> Void)? = nil, onError: ((Error?) -> Void)? = nil){
 
        let params = ["app_id" : "com.IDMValidate.IDMValidate",
                      "MD5":"",
                      "doc_type" : "DRIVING_LICENSE",
                      "country_code": "USA",
                      "SDK_version" : "1.9",
                      "device_type" : "iOS",
                      "platform" : "sdk",
                      "application" : "123"] as Dictionary<String, Any>
       
        //print(params)
        let url = LDAPIManager.Constants.BASEURLForCount /* your API url */
        //print(url)
        let username = LDAPIManager.Constants.auth_user
        let password = LDAPIManager.Constants.auth_password
        
        let credentialData = "\(username):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in params {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
        
        }, usingThreshold: UInt64.init(), to: url, method: .post, headers: headers) { (result) in
            switch result{
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    let json : JSON = JSON(response.result.value)
                    print(json)
                  
                    var code = ""
                    if json != nil
                    {
                        print(json["status"])
                        let objdataViewModel = dataViewModel(withProfile: dictViewModel(json: json.dictionaryValue))
                        print(objdataViewModel.profile.status)
                        print(objdataViewModel.profile.usage_count)
                      
                        var objtestRootClass = testRootClass(fromJson: json)
                        
                        print(objtestRootClass.toDictionary())
                        print(objtestRootClass.usageCount)
                        /*code = json.dictionaryValue[Constant.StaticNameOfVariable.Vstatus]?.stringValue ?? ""
                        let sauth_userid = json.dictionaryValue[Constant.StaticNameOfVariable.Vuser_id]?.stringValue
                        let stauthcurrent = json.dictionaryValue[Constant.StaticNameOfVariable.Vdate]?.stringValue
                        if let strexpdate = stauthcurrent{
                            authcurrent = strexpdate
                        }
                        if let usr = sauth_userid{
                            auth_userid = usr
                            print("user_id  : \(usr)")
                            Tracker.logEvent(withName: "Account Detail",
                                             customAttributes: ["userid":auth_userid])
                          
                        }*/
                        // print(code)
                    }
                    if let err = response.error{
                       
                        if err.localizedDescription == "The Internet connection appears to be offline."{
                          
                        }else{
                             onError?(err)
                        }
                        return
                    }
                    onCompletion?(json , code)
                }
            case .failure(let error):
                print("Error in upload: \(error.localizedDescription)")
                onError?(error)
            }
            
        }
    }
}

