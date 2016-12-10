//
//  DetailViewController.swift
//  GitHubSearch
//
//  Created by Michal Ciesielski on 10/12/2016.
//  Copyright © 2016 Michal Ciesielski. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    
    let user = User().testUser()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.title = user.username
        starsLabel.text = String(user.stars)
        followersLabel.text = String(user.followers)
        avatar.imageFromUrl(user.avatarURL)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
