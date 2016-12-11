//
//  ViewController.swift
//  GitHubSearch
//
//  Created by Michal Ciesielski on 09/12/2016.
//  Copyright © 2016 Michal Ciesielski. All rights reserved.
//

import UIKit
import SwiftyJSON

class SearchViewController: UIViewController  {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var results: [JSON] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        adjustViews()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.realoadResults), name:NSNotification.Name(rawValue: "usersUpdated"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.realoadResults), name:NSNotification.Name(rawValue: "repositoriesUpdated"), object: nil)
    }
    
    func adjustViews() {
        
        searchBar.backgroundImage = UIImage()
        searchBar.barTintColor = .mainGitHubSearchColor()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = .mainGitHubSearchColor()
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 10, width: 35, height: 35))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "searchGit")
        self.navigationItem.titleView = imageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow?[1] {
                let controller = segue.destination as! DetailViewController
                controller.displayedUser = results[indexPath]
            }
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func realoadResults() {
        
        results = users + repos
        results = results.sorted(by: { $0["id"] < $1["id"] })
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        if (results[indexPath.row]["login"].string != nil) {
            cell.textLabel?.text = results[indexPath.row]["login"].stringValue
            cell.accessoryType = .disclosureIndicator
        } else {
            cell.textLabel?.text = results[indexPath.row]["name"].stringValue
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (results[indexPath.row]["login"].string != nil) {
            performSegue(withIdentifier: "showDetail", sender: self)
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        Networking().search(q: searchText)
    }
}
