//
//  JSONModel.swift
//  GitHubSearch
//
//  Created by Vlad Gachi on 21/12/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import Foundation

struct Result: Decodable {
  let items: [Item]
}

struct Item: Decodable {
  let name: String
  let description: String?
  let owner: Owner
  let forksCount: Int
  let openIssuesCount: Int
}

struct Owner: Decodable {
  let login: String
  let avatarUrl: String
}















