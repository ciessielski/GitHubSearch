//
//  GitHubSearchTests.swift
//  GitHubSearchTests
//
//  Created by Michal Ciesielski on 12/12/2016.
//  Copyright © 2016 Michal Ciesielski. All rights reserved.
//

import XCTest
@testable import GitHubSearch

class GitHubSearchTests: XCTestCase {
    
    var detailVC: DetailViewController!
    var searchVC: SearchViewController!
    var net: Networking!
    
    override func setUp() {
        
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        searchVC = storyboard.instantiateViewController(withIdentifier: "searchVC") as! SearchViewController
        _ = searchVC.view
        searchVC.viewDidLoad()
        searchVC.results = ["",""]
        
        detailVC = storyboard.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
        _ = detailVC.view
        
        followers = 100
        stars = 10
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSettingFollowersLabel() {
        
        detailVC.setFollowersLabel()
        XCTAssertEqual(detailVC.followersLabel?.text, String(100))
    }
    
    func testSettingStarsLabel() {
        
        detailVC.setStarsLabel()
        XCTAssertEqual(detailVC.starsLabel?.text, String(10))
    }
    
    func testNumberOfRowsInTableView() {
        XCTAssertEqual(searchVC.tableView.numberOfRows(inSection: 0), searchVC.results.count)
    }
    
    func testLoadingViewHidden() {
        XCTAssert(searchVC.loadingView.isHidden)
    }
    
    func testLoadingViewIsAnimating() {
        XCTAssert(searchVC.loadingView.isAnimating)
    }
}
