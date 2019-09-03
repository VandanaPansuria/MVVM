//
//  CategoryListHandler.swift
//  Taskm8
//
//  Created by MacV on 24/05/19.
//  Copyright © 2019 MacV. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CategoryListHandler
{
    var arrayCategorylist    : Array<Categorylist> = []
  //   var objLoginModel = LoginModel()
    func CategoryList(onCompletion: (([Categorylist], String) -> Void)? = nil, onError: ((Error?) -> Void)? = nil)
    {
       
        let headers = ["Authorization" : "Bearer \(user_token)"]
        LDAPIManager.callApi(API.categorylist.requestString(), param: [:], method: .get, header: headers, encodeType: .default) { (Status, error, json) in
            if json != nil
            {
                let json : JSON = json!
                print(json)
                let code = json.dictionaryValue[Constant.StaticNameOfVariable.Vstatus]?.intValue
                if  code == Constant.StatusCode.statusOk
                {
                   
                  
                    //Token
                   /* user_token = json.dictionaryValue[Constant.StaticNameOfVariable.Vdata]![Constant.StaticNameOfVariable.Vtoken].stringValue
                    
                   //userdata
                    let objuserdata = json.dictionaryValue[Constant.StaticNameOfVariable.Vdata]![Constant.StaticNameOfVariable.Vuser].dictionaryValue
                    
                    let dict : [String:JSON] = objuserdata
                    self.objLoginModel = LoginModel(json: dict)*/
                    
                    //array
                    let objarray = json.dictionaryValue[Constant.StaticNameOfVariable.Vdata]![Constant.StaticNameOfVariable.Vcategories].arrayValue
                    
                    if (objarray.count) > 0
                    {
                        for arr in objarray
                        {
                            let dict : [String:JSON] = arr.dictionaryValue
                            self.arrayCategorylist.append(Categorylist(json: dict))
                        }
                    }
                   
                     onCompletion?(self.arrayCategorylist , "")
                }
                else
                {
                    print(json)
                    LDAppSingleton.showAlert(Constant.AlertTitle.kAlertTitleAppName, json.dictionaryValue[Constant.StaticNameOfVariable.Vmessage]!.stringValue)
                    
                    //   onCompletion?(json , "")
                }
            }
        }
    }
}
