//
//  ViewController.swift
//  GitHubSearch
//
//  Created by Michal Ciesielski on 09/12/2016.
//  Copyright © 2016 Michal Ciesielski. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController  {

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    func adjustViews() {
        
        searchBar.backgroundImage = UIImage()
        navigationBar.setValue(true, forKey: "hidesShadow")
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 10, width: 35, height: 35))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "searchGit")
        navigationBar.topItem?.titleView = imageView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        adjustViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

let items = ["0", "1"]

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "td")
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }

}

