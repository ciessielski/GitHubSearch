//
//  Networking.swift
//  GitHubSearch
//
//  Created by Michal Ciesielski on 11/12/2016.
//  Copyright © 2016 Michal Ciesielski. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var repos: [JSON] = []
var users: [JSON] = []
var followers: Int = 0
var stars: Int = 0
let endpoint = "https://api.github.com/"

class Networking: NSObject {
    
    func search(q: String) {
        
        killOldTasks()
        searchForRepositoriesWithString(q: q)
        searchForUsersWithString(q: q)
    }
    
    func killOldTasks() {
        
        Alamofire.SessionManager.default.session.getAllTasks { tasks in
            tasks.forEach { $0.cancel() }
        }
    }

    func searchForRepositoriesWithString(q: String) {
        
        repos = []
        let request = Alamofire.request(endpoint + "search/repositories?q=\(q)")
        request.responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                repos = json["items"].arrayValue
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "repositoriesUpdated"), object: nil)
            case .failure(let error):
                _ = error
            }
        }
    }
    
    func searchForUsersWithString(q: String) {
        
        users = []
        let request = Alamofire.request(endpoint + "search/users?q=\(q)")
        request.responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                users = json["items"].arrayValue
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "usersUpdated"), object: nil)
            case .failure(let error):
                _ = error
            }
        }
    }
    
    class func numberOfStarsFor(username: String) {
        
        stars = 0
        let request = Alamofire.request(endpoint + "users/\(username)/starred")
        request.responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                stars = json.count
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "starsIntUpdated"), object: nil)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    class func numberOfFollowersFor(username: String) {
        
        followers = 0
        let request = Alamofire.request(endpoint + "users/\(username)")
        request.responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                followers = json["followers"].intValue
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "followersIntUpdated"), object: nil)
            case .failure(let error):
                print(error)
            }
        }
    }
}
