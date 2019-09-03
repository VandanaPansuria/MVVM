//
//  cast.swift
//  MVVMExample
//
//  Created by Administrator on 22/08/19.
//  Copyright © 2019 TMFC. All rights reserved.
//

import Foundation
import SwiftyJSON
class Test: Codable {
    var usageLimit: Int
    var date: String
    var usageCount, status: Int
    var userID: String
    
    enum CodingKeys: String, CodingKey {
        case usageLimit = "usage_limit"
        case date
        case usageCount = "usage_count"
        case status
        case userID = "user_id"
    }
    
    init(usageLimit: Int, date: String, usageCount: Int, status: Int, userID: String) {
        self.usageLimit = usageLimit
        self.date = date
        self.usageCount = usageCount
        self.status = status
        self.userID = userID
    }
}
class testRootClass : NSObject, NSCoding{
    
    var date : String!
    var status : Int!
    var usageCount : Int!
    var usageLimit : Int!
    var userId : String!
    
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        date = json["date"].stringValue
        status = json["status"].intValue
        usageCount = json["usage_count"].intValue
        usageLimit = json["usage_limit"].intValue
        userId = json["user_id"].stringValue
    }

    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if date != nil{
            dictionary["date"] = date
        }
        if status != nil{
            dictionary["status"] = status
        }
        if usageCount != nil{
            dictionary["usage_count"] = usageCount
        }
        if usageLimit != nil{
            dictionary["usage_limit"] = usageLimit
        }
        if userId != nil{
            dictionary["user_id"] = userId
        }
        return dictionary
    }
  
    @objc required init(coder aDecoder: NSCoder)
    {
        date = aDecoder.decodeObject(forKey: "date") as? String
        status = aDecoder.decodeObject(forKey: "status") as? Int
        usageCount = aDecoder.decodeObject(forKey: "usage_count") as? Int
        usageLimit = aDecoder.decodeObject(forKey: "usage_limit") as? Int
        userId = aDecoder.decodeObject(forKey: "user_id") as? String
    }
   
    func encode(with aCoder: NSCoder)
    {
        if date != nil{
            aCoder.encode(date, forKey: "date")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if usageCount != nil{
            aCoder.encode(usageCount, forKey: "usage_count")
        }
        if usageLimit != nil{
            aCoder.encode(usageLimit, forKey: "usage_limit")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "user_id")
        }
        
    }
    
}
