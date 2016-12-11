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

var users: [JSON] = []
var followers: Int = 0
var stars: Int = 0

class Networking: NSObject {

    func searchForUsersWithString(q: String) -> Void {
        
        users = []
        Alamofire.SessionManager.default.session.getAllTasks { tasks in
            tasks.forEach { $0.cancel() }
//            for t in tasks {
//                print("task id: \(t.taskIdentifier) desc: \(t.taskDescription)")
//            }
        }
        
        let request = Alamofire.request("https://api.github.com/search/users?q=\(q)")
        request.responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                users = json["items"].arrayValue
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "usersUpdated"), object: nil)
            case .failure(let error):
                print(error)
            }
        }
//        print("reqyset desc: \(request.description)")
//        print("reqyset task: \(request.task)")
        
    }
    
    class func numberOfStarsFor(username: String) {
        
        stars = 0
        let request = Alamofire.request("https://api.github.com/users/\(username)/starred")
        request.responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                stars = json.count
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "starsIntUpdated"), object: nil)
                print(json)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    class func numberOfFollowersFor(username: String) {
        
        followers = 0
        let request = Alamofire.request("https://api.github.com/users/\(username)")
        request.responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                followers = json["followers"].intValue
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "followersIntUpdated"), object: nil)
                print(json)
            case .failure(let error):
                print(error)
            }
        }
    }
}
