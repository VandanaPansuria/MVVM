//
//  Videostreamandtbl.swift
//  MVVMExample
//
//  Created by MacV on 03/09/19.
//  Copyright © 2019 TMFC. All rights reserved.
//

import UIKit

import MediaPlayer
class Videostreamandtbl: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var streamPlayer : MPMoviePlayerController =  MPMoviePlayerController(contentURL: NSURL(string:"http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8") as URL?)

    override func viewDidLoad() {
        super.viewDidLoad()

        streamPlayer.view.frame = self.view.bounds
        self.view.addSubview(streamPlayer.view)
        
        streamPlayer.isFullscreen = true
        // Play the movie!
        streamPlayer.play()
        
        //table
        // tableView.delegate = self
        // tableView.dataSource = self
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

//for table
/*extension Videostreamandtbl : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayBrowselist.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(  withIdentifier: "MyTaskTableViewCell",  for: indexPath) as! MyTaskTableViewCell
        cell.objBrowselist = self.arrayBrowselist[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        BrowseDeatilID = self.arrayBrowselist[indexPath.row].id
        frombrowse = "mytask"
        self.performSegue(withIdentifier: "mytaskdetail", sender: nil)
    }
    private func tableView(tableView: UITableView, n indexPath: IndexPath)
    {
        print("You tapped cell number \(indexPath.row).")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 330//UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
}*/
class ProfileTableViewCell: UITableViewCell {
    
    /* @IBOutlet weak var lblUsername: UILabel!
     @IBOutlet weak var lblComment: UILabel!
     @IBOutlet var floatRatingView: FloatRatingView!
     @IBOutlet weak var imgView: UIImageView!
     override func awakeFromNib() {
     super.awakeFromNib()
     
     }
     var objUserCommentlist : UserCommentlist?{
     didSet{
     
     let dictuser = LoginModel(json:(objUserCommentlist!.user))
     self.lblUsername.text = dictuser.first_name + " " + dictuser.last_name
     
     //userImage
     var imgUrluser = dictuser.avatar
     
     imgUrluser = imgUrluser.replacingOccurrences(of: "..", with: "")
     self.imgView.sd_setImage(with: URL(string: imgUrluser), placeholderImage: UIImage(named: "group14"))
     self.imgView.layer.cornerRadius = 20.0
     self.imgView.clipsToBounds = true
     
     lblComment.text = objUserCommentlist?.comment
     
     floatRatingView.backgroundColor = UIColor.clear
     floatRatingView.delegate = self
     floatRatingView.contentMode = UIView.ContentMode.scaleAspectFit
     floatRatingView.type = .halfRatings
     floatRatingView.editable = false
     floatRatingView.rating = Double(objUserCommentlist!.rating) as! Double
     
     }
     }*/
    
}
