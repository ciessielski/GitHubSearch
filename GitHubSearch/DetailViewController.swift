//
//  DetailViewController.swift
//  GitHubSearch
//
//  Created by Michal Ciesielski on 10/12/2016.
//  Copyright © 2016 Michal Ciesielski. All rights reserved.
//

import UIKit
import SwiftyJSON

class DetailViewController: UIViewController {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    var displayedUser: JSON = [""]
    
    override func viewWillAppear(_ animated: Bool) {
        
        Networking.numberOfStarsFor(username: displayedUser["login"].stringValue)
        Networking.numberOfFollowersFor(username: displayedUser["login"].stringValue)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.setFollowersLabel), name:NSNotification.Name(rawValue: "followersIntUpdated"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.setStarsLabel), name:NSNotification.Name(rawValue: "starsIntUpdated"), object: nil)

        self.navigationItem.title? = displayedUser["login"].stringValue
        avatar.imageFromUrl(String(displayedUser["avatar_url"].stringValue))
    }
    
    func setFollowersLabel() {
        followersLabel?.text = String(followers)
    }
    
    func setStarsLabel() {
        starsLabel?.text = String(stars)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
