//
//  UISearchController.swift
//  GitHubSearch
//
//  Created by Vlad Gachi on 21/12/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

extension UISearchController {
  
  static let searchController: UISearchController = {
    let sc = UISearchController(searchResultsController: nil)
    sc.searchBar.barStyle       = .black
    sc.searchBar.tintColor      = .white
    return sc
  }()
}






















