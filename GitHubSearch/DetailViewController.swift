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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.title = "username"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
