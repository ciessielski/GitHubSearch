//
//  User.swift
//  GitHubSearch
//
//  Created by Michal Ciesielski on 10/12/2016.
//  Copyright © 2016 Michal Ciesielski. All rights reserved.
//

import UIKit

class User {
    
    var id: Int!
    var username: String!
    var avatarURL: String!
    var stars: Int!
    var followers: Int!
    
    func testUser() -> User {
        
        let testUser = User()
        testUser.id = 0
        testUser.username = "ciessielski"
        testUser.stars = 1
        testUser.followers = 10
        testUser.avatarURL = "https://avatars.githubusercontent.com/u/2165282?v=3"
        return testUser
    }
}
