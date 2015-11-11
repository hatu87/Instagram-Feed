//
//  PhotosViewController.swift
//  Instagram-Feed-Lab
//
//  Created by ToanVo on 11/11/15.
//  Copyright © 2015 hatu. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

    var photos = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPhotos()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadPhotos(){
        let clientId = "d7b463a29267440280a523097ebf2f37"
        let url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=\(clientId)")!
        let session = NSURLSession.sharedSession()
        let task  = session.dataTaskWithURL(url) { (data: NSData?, respond: NSURLResponse?, error: NSError?) -> Void in
            guard error == nil else {
                print("Error loading from URL", error!)
                return
            }
            let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            self.photos = json["data"] as! [NSDictionary]
            print( "photos", self.photos)

        }
 
        task.resume()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
