//
//  Constant.swift
//  Taskm8
//
//  Created by MacV on 21/05/19.
//  Copyright © 2019 MacV. All rights reserved.
//

import UIKit

// App theme color
let kAppThemeDarkGrayColor = UIColor(red:116/255, green:116/255, blue:116/255, alpha:1.00)

// App Hind Font
let fontRobotoMedium = UIFont(name: "Roboto-Medium", size: 16)
var appLocaleIdentifier: String = Locale.current.identifier

//API Parameter Name
var tScreen = "login"
var user_token = ""

var subcategoryID = "0"
var subcategoryIDMyTask = "1"
var subcategoryIDpost = "1"
var BrowseDeatilID = "1"
var strStatus = "OPEN"
var frombrowse = "browse"
var fromtask = "browse"
var browsetaskdict : [String:String] = ["applyedtask" : "false" , "category" : "","subcategory" :  "","subcategory2" :  "","keywords" : "","radius" : "","status" : "OPEN"]
var mytaskdict : [String:String] = ["assigntask" : "false" , "category" : "","subcategory" :  "","subcategory2" :  "","keywords" : "","status" : "OPEN"]
var arrmaincat : [String] = []
var arrsubcategory1 : [String] = []
var arrsubcategory2 : [String] = []
var arrmaincatID : [Int] = []
var arrsubcategory1ID : [Int] = []
var arrsubcategory2ID : [Int] = []

var arrmaincatmytask : [String] = []
var arrsubcategory1mytask : [String] = []
var arrsubcategory2mytask : [String] = []
var arrmaincatIDmytask : [Int] = []
var arrsubcategory1IDmytask : [Int] = []
var arrsubcategory2IDmytask : [Int] = []

var arrmaincatpost : [String] = []
var arrsubcategory1post : [String] = []
var arrsubcategory2post : [String] = []
var arrmaincatIDpost : [Int] = []
var arrsubcategory1IDpost : [Int] = []
var arrsubcategory2IDpost : [Int] = []

var ImageArray : [UIImage] = []
var jobalias = ""
var fromsettings : Bool = false
var avatarimg : UIImage = UIImage()
var UserProfileID = "1"
class Constant: NSObject {
    
    struct AlertMessage
    {
        static let kAlertMsgNoInternet = "No Internet connection is found"
        static let kAlertMsgSomethingWentWrong = "Something went wrong"
    }
       
    struct AlertButton
    {
        static let kAlertButtonOK = "OK"
        static let kAlertButtonCancel = "Cancel"
        static let kAlertButtonYes = "Yes"
        static let kAlertButtonNo = "No"
    }
    
    struct AlertTitle
    {
        static let kAlertTitleAppName = "Taskm8"
        static let kAlertTitleInvalid = "Invalid"
        static let kAlertTitleSuccess  = "Success"
        static let kAlertTitleError  = "Error"
        static let kAlertTitleNoInternet = "No Internet!"
        static let kAlertTitleEmail = "Could Not Send Email"
        static let kAlertTitleSorry = "Sorry"

    }
   
    struct HeaderType {
        
        static let HeaderCheckOut = "application/x-www-form-urlencoded"
        static let KACCESSTOKEN = "KAccessToken"

    }
    struct StatusCode
    {
        static let codeOk = 200
        static let codecodeBadrequest = 400
        static let statusOk = 1
        static let statusFalse = 0
        static let codeNovalue = 302
        static let codeDealCompleted = 303
    }
    
  
    struct StatusErrorMessade {
        
        static let response_message = "Message"
    }
    struct ApiNames{
        static let Vlogin = "api/auth/login"
        static let VFBlogin = "api/auth/facebook/login"
        static let Vregister = "api/auth/register"
        static let Vforgot = "api/auth/recover"
        static let Vrefreshtoken = "api/auth/token"
        static let Vsummary = "api/dashboard/summary"
        static let Vcategorylist = "api/dashboard/category/list"
        static let Vupdateaccount = "api/account/update"
        static let Vdoerprofile = "api/profile/get"
        static let Vdoerprofileupdate = "api/profile/update"
        static let Vuploaddocument = "api/profile/document/upload"
        static let Vremovedocument = "api/profile/document/remove/6"
        static let Vdocumentlist = "api/profile/document/list"
        static let Vsubcategory = "api/category/sub/list"
        static let Vcreate = "api/job/create"
        static let Veditjob = "api/job/edit?id=29"
        static let Vbrowse = "api/task/browse"
        static let VTask = "api/task"
        static let VBrowseDetail = "api/job/details"
        static let Vmessagesend = "api/job/message/send"
        static let Vchangejob = "api/job/"
        static let Vgetaccount = "api/account"
        static let Vgetapaymenthistory = "api/payment/history"
        static let Vuserdoerprofile = "api/user"
    }
    
    struct StaticNameOfVariable
    {
        //API
        static let Vdata = "data"
        static let Vstatus = "status"
        static let Vmessage = "message"
        static let Vtransaction_id = "transaction_id"
        
        //Profile
        static let Vemail = "email"
        static let Vusername = "username"
        static let Vpassword = "password"
        static let Vpassword_confirmation = "password_confirmation"
        static let Vfacebook_id = "facebook_id"
        
        //login
        
        static let Vtoken = "token"
        static let Vuser = "user"
        static let Vaddress = "address"
        static let Vlat = "lat"
        static let Vlng = "lng"
        static let Vphone = "phone"
        static let Vtag_line = "tag_line"
        static let Vuser_role = "user_role"
        static let Vlast_name = "last_name"
        static let Vdescription = "description"
        static let Vdob = "dob"
        static let Vfirst_name = "first_name"
        static let Vid = "id"
        static let Vavatar = "avatar"
        
        //update doer profile
        static let Vwork_description = "work_description"
        static let Vwork_location = "work_location"
        static let Vgender = "gender"
        static let Vage_group = "age_group"
        
        //job create
        static let Vtitle = "title"
        static let Vcategory_id = "category_id"
        static let Vpost_date = "post_date"
        static let Vdue_date = "due_date"
        static let Vmaterial_require = "material_require"
        static let Vamount = "amount"
        static let Vlocation = "location"
        static let Vjob_expire = "job_expire"
        
        //categories
        static let Valias = "alias"
        static let Vimage  = "image"
        static let Vparent  = "parent"
        static let Vis_active  = "is_active"
        static let Vname     = "name"
        static let Vdisplay_order    = "display_order"
        static let Vcategories    = "categories"
        
        //Summary
        
        static let Vearned = "earned"
        static let Von_bid  = "on_bid"
        static let Vassigned  = "assigned"
        static let Vcompleted  = "completed"
        static let Vspend     = "spend"
        static let Vopen_offers    = "open_offers"
        static let Vdoer     = "doer"
        static let Vposter    = "poster"
        
        //browse
        static let Vpage = "page"
        static let Vkeywords  = "keywords"
        static let Vradius  = "radius"
        static let Vapplyedtask  = "applyedtask"
        static let Vjobs  = "jobs"
        static let Vbuttons  = "buttons"
        static let Vsecondary  = "secondary"
        static let Vprimary  = "primary"
        
        static let Vcategory  = "category"
        static let Vdistance = "distance"
        
        //My task
        static let Vcompletedbyme = "completedbyme"
        static let Vassigntome  = "assigntome"
        
        //Detail
        static let Vsender = "sender"
        static let Vjob_id  = "job_id"
        static let Vjob  = "job"
        static let Vmessages  = "messages"
        static let Vapplyed_user  = "applyed_user"
        static let Vaction = "action"
        
        //Payment History
        static let VTransactionID  = "TransactionID"
        static let VDatetime  = "Datetime"
        static let VUsername  = "Username"
        static let VDebit  = "Debit"
        static let VCredit  = "Credit"
        static let Vhistory  = "history"
        
        //Comment
        static let Vrating = "rating"
        static let Vcomment = "comment"
    }
    
   class func XSET_STRING(_ key:String,_ value:String)
    {
        UserDefaults.standard.set(value, forKey:key)
        //LDAppSingleton.XSYNC()
    }
    

   

}
func stringfromdate(strDate : String) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let date = dateFormatter.date(from:strDate)
    dateFormatter.dateFormat = "dd MMM yyyy"
    return dateFormatter.string(from: date!)
}
func stringfromholiday(strDate : String) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMM yyyy"
    let date = dateFormatter.date(from:strDate)
    dateFormatter.dateFormat = "dd MMM"
    return dateFormatter.string(from: date!)
}

extension String
{
    func trim() -> String
    {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}


func setviewImage(view : UIView){
    view.backgroundColor = UIColor.white
    view.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    view.layer.borderWidth = 1.0
  //  view.layer.opacity = 0.6
    view.layer.shadowRadius = 5
    view.layer.shadowOpacity = 0.35
    view.layer.shadowOffset = CGSize(width: 0, height: 0)
    view.layer.cornerRadius = 6
 }
//Scan View
@available(iOS 11.0, *)
func detectedLangauge<T: StringProtocol>(_ forString: T) -> String? {
    guard let languageCode = NSLinguisticTagger.dominantLanguage(for: String(forString)) else {
        return nil
    }
    let detectedLangauge = Locale.current.localizedString(forIdentifier: languageCode)
    return detectedLangauge
}
func setdatefromstring(strdate : String) -> String
{
    var datestr:Date? = nil
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMddyyyy"
     datestr = dateFormatter.date(from: strdate)
    if dateFormatter.date(from: strdate) != nil{
        dateFormatter.dateFormat = "MM/dd/yyyy"
    }else{
        dateFormatter.dateFormat = "yyyyMMdd"
        datestr = dateFormatter.date(from: strdate)
        dateFormatter.dateFormat = "MM/dd/yyyy"
    }
    return String(dateFormatter.string(from: datestr!))
}

func toCIImage(image: UIImage) -> CIImage {
    return image.ciImage ?? CIImage.init(cgImage:  image.cgImage!)
}

func getCity(city : String , abbreviation : String) -> String{
    if let range = city.range(of: abbreviation) {
        let firstPartIncludingDelimiter = city.substring(to: range.lowerBound)
        var editedText = firstPartIncludingDelimiter.replacingOccurrences(of: ",", with: "")
        return editedText
    }
    return ""
}

func fixdateconvertor(strdate : String , fixformate : String) -> String{
    let  dateformatter = DateFormatter()
    dateformatter.dateFormat = fixformate
    let convertdate = dateformatter.date(from: strdate)
    dateformatter.dateFormat = "EEE,dd MMM"
  
    if convertdate == nil{
        //converterDate = ""
    }else{
        //converterDate = "not null"
    }
    return dateformatter.string(from: convertdate ?? Date())
}

func imageIsNullOrNot(imageName : UIImage)-> Bool
{
    
    let size = CGSize(width: 0, height: 0)
    if (imageName.size.width == size.width)
    {
        return false
    }
    else
    {
        return true
    }
}

func getAddress(of : String , with : String, address : String) -> String{
    let editedText = address.replacingOccurrences(of: of, with: with)
    return editedText
}

extension Date {
    
    func isEqualTo(_ date: Date) -> Bool {
        return self == date
    }
    
    func isGreaterThan(_ date: Date) -> Bool {
        return self > date
    }
    
    func isSmallerThan(_ date: Date) -> Bool {
        return self < date
    }
}
extension UIView {
    
    func dropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(named: "#33155D")?.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize.zero//CGSize(width: -1, height: 1)
       // self.layer.shadowRadius = 2
        //self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
       // self.layer.shouldRasterize = true
       // self.layer.rasterizationScale = UIScreen.main.scale
        self.layer.cornerRadius = 7.0
    }
    
}

func isValidEmail(email:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: email)
}
func isValidPassword(password : String) -> Bool {
    //let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
    let passwordRegex = "^[A-Za-z0-9]{6,}$"
    return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
}
func isValidUsername(name : String) -> Bool {
    let nameRegex = "^[A-Za-z]{2,}$"
    return NSPredicate(format: "SELF MATCHES %@", nameRegex).evaluate(with: name)
}

func topView(navigationController : UINavigationController){
   /* navigationController.navigationBar.layer.masksToBounds = false
    navigationController.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
    navigationController.navigationBar.layer.shadowOpacity = 0.5
    navigationController.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
    navigationController.navigationBar.layer.shadowRadius = 2*/
   // navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "SFUIText-Semibold", size: 18)!]
  
    navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController.navigationBar.shadowImage = UIImage()
}
func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
    let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.byWordWrapping
    label.font = font
    label.text = text
    label.sizeToFit()
    
    return label.frame.height
}
