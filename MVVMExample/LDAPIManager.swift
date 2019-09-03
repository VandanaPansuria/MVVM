//
//  LDAPIManager.swift
//  MVVMExample
//
//  Created by Administrator on 22/08/19.
//  Copyright © 2019 TMFC. All rights reserved.
//

import Foundation
import SwiftyJSON
class LDAPIManager: NSObject {
    
    struct Constants {
        
        //static let  OCR_SERVER_BASE = "http://192.168.1.88:8080"
        static let  OCR_SERVER_BASE = "http://103.11.119.157:8181"
        static let  MRZ_OCR_SERVER = "/mrzGenericOcr"
        
        //static let IPAddress = "192.168.1.98" //32
        static let IPAddress = "103.11.119.155"
        static let BASEURLTFMCE = "http://" +  IPAddress + "/idm-sample-verify/"
        
        
        static let BASEURLForFaceImage = "http://uat.idmerit.com:9000/fcompare" //server
        static let BASEURLForCount = BASEURLTFMCE + "authorize.php"
        
        static let BASEURLForMRZ = OCR_SERVER_BASE + MRZ_OCR_SERVER
        static let BASEURLForVerify = BASEURLTFMCE + "idm_insert.php"
        
         static let user_name = "demo_ios" //47
         static let user_PWD = "c73fd6a4169a467723aa305ff8adbdd7"
        
        //static let user_name = "KRental" //56
        //static let user_PWD = "da62eeace99fd10bbb0603484403aa6e"
        
        // static let user_name = "Paypal" //57
        // static let user_PWD = "1d6d2c11afb383f4eedc7e3a9e32b6e8"
        
        //static let user_name = "josh" //58
        // static let user_PWD = "5f04b8f36f6e4fd7af6917f5f734fef75f04b8f36f"
        
     //   static let user_name = "userandrei" //59
      //  static let user_PWD = "be9ea54b03e00cbc4c4af13ae02c59c1"
        
        static let auth_user = user_name
        static let auth_password = user_PWD
        
    }
    static var sharedInstance: LDAPIManager = LDAPIManager()
}
class dictViewModel {

    var status: String = ""
    var user_id: String =  ""
    var usage_count: String = ""
    var date: String = ""
    
   /* init(status : String , user_id: String , usage_count: String, date: String){
        self.status = status
        self.user_id = user_id
        self.usage_count = usage_count
        self.date = date
    }*/
     init(json : [String:JSON]){
        status           = json["status"]!.stringValue
        user_id               = json["user_id"]!.stringValue
        usage_count                = json["usage_count"]!.stringValue
        date        = json["date"]!.stringValue
        
      //  self.init(status: status, user_id: user_id, usage_count: usage_count, date: date)
    }
    
}
class dataViewModel {
    
     let profile: dictViewModel
    init(withProfile profile: dictViewModel){
        self.profile = profile
    }
}
