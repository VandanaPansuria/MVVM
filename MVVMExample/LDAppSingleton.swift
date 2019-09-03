//
//  AppSingleton.swift
//  Taskm8
//
//  Created by MacV on 21/05/19.
//  Copyright © 2019 MacV. All rights reserved.
//

import UIKit
import SystemConfiguration
import NVActivityIndicatorView
import SwiftyJSON
import CoreLocation


class LDAppSingleton: NSObject {
    // MARK: - Shared Instance

    struct Constants {
        //Appdelegate shared object
       // static let appDelegate : AppDelegate = AppDelegate.sharedInstance()
        
        //App Singleton class Object
        static let appSingleton = LDAppSingleton.sharedInstance
        
    }
    
    static let sharedInstance: LDAppSingleton = {
        let instance = LDAppSingleton()
        // setup code
        return instance
    }()
    
    class func XSYNC()
    {
        UserDefaults.standard.synchronize()
    }

    // MARK: - Initialization Method    
    override init() {
        super.init()
    }
    
  class func dispayDateForRedister(date: Date) -> String
    {
        let f = DateFormatter()
        f.dateFormat = "dd/MM/yyyy"
        
        return f.string(from: date)
    }
     // MARK: - Add uiviewcontroller in uiview
   class func addSubviews(subView:UIView, toView parentView:UIView) {
        
        parentView.addSubview(subView)
        subView.translatesAutoresizingMaskIntoConstraints = false
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
        
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[subView]-0-|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[subView]-0-|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
    }
    
  
    
    // MARK:- Resize Image
   class func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    // MARK:- Convert timeStringFromUnixTime
   class func timeStringFromUnixTime(unixTime: Double) -> String {
        let date = NSDate(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        
        // Returns date formatted as 12 hour time.
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        
        // dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: date as Date)
    }
    
    
   class func timeStringFromUnixTimes(unixTime: Double) -> String
    {
        let date = NSDate(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        
        // Returns date formatted as 12 hour time.
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        //dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        
        // dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: date as Date)
    }
    
    //convert address string into lat long coordinate
   class  func addressToLatLong(address: String, completion:@escaping (_ coder: CLLocationCoordinate2D?, _ e: NSError?) -> Void){
        self.startNVActivity()
        CLGeocoder().geocodeAddressString(address, completionHandler: {(result,error) -> Void in
            if error == nil{
                print(result!)
                
                completion(result?.first?.location?.coordinate, nil)
            }
            else{
                completion(nil, error as NSError?)
            }
            
            self.stopNVActivity()
        })
    }
    //MARK: activity animation
    
    class func startLoadingAnimation(){
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    class func stopLoadingAnimation(){
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    // MARK : Start Activity
    class func startNVActivity() {
        
        NVActivityIndicatorView.DEFAULT_TYPE = .ballRotateChase
        NVActivityIndicatorView.DEFAULT_COLOR = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        let activityData = ActivityData()
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
    }
    
    // MARK : Stop Activity
    class func stopNVActivity() {        
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
    }
    
    // MARK : Set TicketsAndPriceTextBold using you can set text bold in between two text
    class func BasketTextBold(_ wholeText : String,_ Tickets : String,_ Price : String,_ label : UILabel)
    {
        let attributedString : NSMutableAttributedString = NSMutableAttributedString(string: wholeText)
        
        let range = (wholeText as NSString).range(of: Tickets)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "Roboto-Bold", size: 16)!, range: range)
        
        let range1 = (wholeText as NSString).range(of: Price)
        attributedString.addAttribute(NSAttributedString.Key.font, value:  UIFont(name: "Roboto-Medium", size: 16)!, range: range1)
//
        label.attributedText = attributedString
    }
    
    // MARK: - Set Blur image for using blurImageview
   class func bluEffectCust(_ img:UIImageView)
    {
        DispatchQueue.main.async {
            
            let inputImage = CIImage(cgImage: (img.image?.cgImage)!)
            let filter = CIFilter(name: "CIGaussianBlur")
            filter?.setValue(inputImage, forKey: "inputImage")
            filter?.setValue(3, forKey: "inputRadius")
            let blurred = filter?.outputImage
            
            var newImageSize: CGRect = (blurred?.extent)!
            newImageSize.origin.x += (newImageSize.size.width - (img.image?.size.width)!) / 2
            newImageSize.origin.y += (newImageSize.size.height - (img.image?.size.height)!) / 2
            newImageSize.size = (img.image?.size)!
            
            let resultImage: CIImage = filter?.value(forKey: "outputImage") as! CIImage
            let context: CIContext = CIContext.init(options: nil)
            let cgimg: CGImage = context.createCGImage(resultImage, from: newImageSize)!
            let blurredImage: UIImage = UIImage.init(cgImage: cgimg)
            img.image = blurredImage
        }
        
    }
   
    class func hideAlert() {

        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }
        // MARK: - Show Alert
    class func showMeTheAlertDetectYESNO(_ title: String,_ message: String,handler: ((UIAlertAction) -> Swift.Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constant.AlertButton.kAlertButtonYes, style: UIAlertAction.Style.default, handler: handler))
          alert.addAction(UIAlertAction(title: Constant.AlertButton.kAlertButtonNo, style: UIAlertAction.Style.default, handler: handler))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    class func showMeTheAlertDetect(_ title: String,_ message: String,handler: ((UIAlertAction) -> Swift.Void)? = nil) {
        LDAppSingleton.stopNVActivity()
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constant.AlertButton.kAlertButtonOK, style: UIAlertAction.Style.default, handler: handler))
           UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    class func showMeTheAlertsorry(_ message: String,handler: ((UIAlertAction) -> Swift.Void)? = nil) {
        let alert = UIAlertController(title: Constant.AlertTitle.kAlertTitleSorry, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constant.AlertButton.kAlertButtonOK, style: UIAlertAction.Style.default, handler: handler))
           UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    class func showAlert(_ title: String,_ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constant.AlertButton.kAlertButtonOK, style: UIAlertAction.Style.default, handler: nil))
           UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    class func showMeTheAlert(_ message: String) {
        let alert = UIAlertController(title: Constant.AlertTitle.kAlertTitleAppName, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constant.AlertButton.kAlertButtonOK, style: UIAlertAction.Style.default, handler: nil))
           UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    class func showTheAlert(_ message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constant.AlertButton.kAlertButtonOK, style: UIAlertAction.Style.default, handler: nil))
           UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - check network
    class func isNetworkAvailable() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
}

//MARK: create EdgeShadowLayer for uiview
public class EdgeShadowLayer: CAGradientLayer {
    
    public enum Edge {
        case Top
        case Left
        case Bottom
        case Right
    }
    
    public init(forView view: UIView,
                edge: Edge = Edge.Top,
                shadowRadius radius: CGFloat = 20.0,
                toColor: UIColor = UIColor.white,
                fromColor: UIColor = UIColor.black) {
        super.init()
        self.colors = [fromColor.cgColor, toColor.cgColor]
        self.shadowRadius = radius
        
        let viewFrame = view.frame
        
        switch edge {
        case .Top:
            startPoint = CGPoint(x: 0.5, y: 0.0)
            endPoint = CGPoint(x: 0.5, y: 1.0)
            self.frame = CGRect(x: 0.0, y: 0.0, width: viewFrame.width, height: shadowRadius)
        case .Bottom:
            startPoint = CGPoint(x: 0.5, y: 1.0)
            endPoint = CGPoint(x: 0.5, y: 0.0)
            self.frame = CGRect(x: 0.0, y: viewFrame.height - shadowRadius, width: viewFrame.width, height: shadowRadius)
        case .Left:
            startPoint = CGPoint(x: 0.0, y: 0.5)
            endPoint = CGPoint(x: 1.0, y: 0.5)
            self.frame = CGRect(x: 0.0, y: 0.0, width: shadowRadius, height: viewFrame.height)
        case .Right:
            startPoint = CGPoint(x: 1.0, y: 0.5)
            endPoint = CGPoint(x: 0.0, y: 0.5)
            self.frame = CGRect(x: viewFrame.width - shadowRadius, y: 0.0, width: shadowRadius, height: viewFrame.height)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


