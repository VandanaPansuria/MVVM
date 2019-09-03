//
//  Categorylist.swift
//  Taskm8
//
//  Created by MacV on 06/06/19.
//  Copyright © 2019 MacV. All rights reserved.
//

import Foundation
import SwiftyJSON

class Categorylist: NSObject
{
    var alias                : String = ""
    var image                : String = ""
  
    
    override init( )
    {
        
    }
    
    init(json : [String:JSON])
    {
        
        alias                = (json[Constant.StaticNameOfVariable.Valias]?.stringValue)!
        image                = (json[Constant.StaticNameOfVariable.Vimage]?.stringValue)!
     
      
    }
}
