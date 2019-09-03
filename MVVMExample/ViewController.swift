//
//  ViewController.swift
//  MVVMExample
//
//  Created by Administrator on 22/08/19.
//  Copyright © 2019 TMFC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController {

    var objAuthorizedHandler = AuthorizedHandler()
    override func viewDidLoad() {
        super.viewDidLoad()
        apicall()
        objAuthorizedHandler.countrequestWith(parameters: [:], onCompletion: { (json, status) in
            print(json)
        }) { (error) in
            print(error)
        }
        print(calc("1+1"))
    }
    func calc(_ expression: String) -> Double {
        if expression.contains("+"){
            return 3
        }
        return 4
    }
    func apicall(){
        postLogin(urlString: "http://demo.com", email: "abc@gmail.com", password: "pass") { (loginRequest) in
       
            print(loginRequest?.data?.phone)
           
        }
 
    }
    func postLogin(urlString: String, email: String, password: String, completion: @escaping (UserDataRootClass?) -> Void) {
      /*  Alamofire.request(urlString, method: .get, parameters: ["email": email, "pw": password]).response {
            response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let json : JSON = JSON(response)
                let loginRequest = try decoder.decode(UserDataRootClass.self, from: data)
                completion(loginRequest)
            } catch let error {
                print(error)
                completion(nil)
            }
        }*/
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            let params = ["email": email, "pw": password]
            for (key, value) in params {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
            
        }, usingThreshold: UInt64.init(), to: urlString, method: .get, headers: nil) { (result) in
            print(result)
            switch result{
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    let json : JSON = JSON(response.result.value)
                    print(json)
                    
                    var code = ""
                    if json != nil
                    {
                      
                      
                    }
                    if let err = response.error{
                        
                        if err.localizedDescription == "The Internet connection appears to be offline."{
                            
                        }else{
                          //  onError?(err)
                        }
                        return
                    }
                    //onCompletion?(json , code)
                }
            case .failure(let error):
                print("Error in upload: \(error.localizedDescription)")
                //onError?(error)
            }
            
        }
    }
    
}

class UserDataRootClass : NSObject, NSCoding{
    
    var data : UserDataData!
    var ret : Bool!
    var text : String!
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        let dataJson = json["data"]
        if !dataJson.isEmpty{
            data = UserDataData(fromJson: dataJson)
        }
        ret = json["ret"].boolValue
        text = json["text"].stringValue
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if data != nil{
            dictionary["data"] = data.toDictionary()
        }
        if ret != nil{
            dictionary["ret"] = ret
        }
        if text != nil{
            dictionary["text"] = text
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        data = aDecoder.decodeObject(forKey: "data") as? UserDataData
        ret = aDecoder.decodeObject(forKey: "ret") as? Bool
        text = aDecoder.decodeObject(forKey: "text") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if data != nil{
            aCoder.encode(data, forKey: "data")
        }
        if ret != nil{
            aCoder.encode(ret, forKey: "ret")
        }
        if text != nil{
            aCoder.encode(text, forKey: "text")
        }
        
    }
    
}
class UserDataData : NSObject, NSCoding{
    
    var city : String!
    var email : String!
    var gdpr : String!
    var nev : String!
    var phone : String!
    var street : String!
    var zip : String!
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        city = json["city"].stringValue
        email = json["email"].stringValue
        gdpr = json["gdpr"].stringValue
        nev = json["nev"].stringValue
        phone = json["phone"].stringValue
        street = json["street"].stringValue
        zip = json["zip"].stringValue
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if city != nil{
            dictionary["city"] = city
        }
        if email != nil{
            dictionary["email"] = email
        }
        if gdpr != nil{
            dictionary["gdpr"] = gdpr
        }
        if nev != nil{
            dictionary["nev"] = nev
        }
        if phone != nil{
            dictionary["phone"] = phone
        }
        if street != nil{
            dictionary["street"] = street
        }
        if zip != nil{
            dictionary["zip"] = zip
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        city = aDecoder.decodeObject(forKey: "city") as? String
        email = aDecoder.decodeObject(forKey: "email") as? String
        gdpr = aDecoder.decodeObject(forKey: "gdpr") as? String
        nev = aDecoder.decodeObject(forKey: "nev") as? String
        phone = aDecoder.decodeObject(forKey: "phone") as? String
        street = aDecoder.decodeObject(forKey: "street") as? String
        zip = aDecoder.decodeObject(forKey: "zip") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if city != nil{
            aCoder.encode(city, forKey: "city")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if gdpr != nil{
            aCoder.encode(gdpr, forKey: "gdpr")
        }
        if nev != nil{
            aCoder.encode(nev, forKey: "nev")
        }
        if phone != nil{
            aCoder.encode(phone, forKey: "phone")
        }
        if street != nil{
            aCoder.encode(street, forKey: "street")
        }
        if zip != nil{
            aCoder.encode(zip, forKey: "zip")
        }
        
    }
    
}
