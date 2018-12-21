//
//  File.swift
//  GitHubSearch
//
//  Created by Vlad Gachi on 21/12/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
  
  // MARK: - Properties
  var result: Item? {
    didSet {
      guard let result = result else { return }
      // Set Controller's title
      navigationItem.title = result.name
      // Set user's details
      userProfileImage.loadImageWith(urlString: result.owner.avatarUrl)
      usernameLabel.text = result.owner.login
      // Set number of forks & issues
      forksCountLabel.text  = "Number of forks: \(result.forksCount)"
      issuesCountLabel.text = "Number of issues: \(result.openIssuesCount)"
      // Set description
      descriptionLabel.text = result.description
    }
  }
  
  private let userProfileImage  = UIImageView.userProfileImage
  
  private let usernameLabel     = UILabel.createLabelWith(font: .boldSystemFont(ofSize: 16))
  private let forksCountLabel   = UILabel.createLabelWith(font: .systemFont(ofSize: 14))
  private let issuesCountLabel  = UILabel.createLabelWith(font: .systemFont(ofSize: 14))
  private let descriptionLabel  = UILabel.createLabelWith(font: .systemFont(ofSize: 14))
  
  
  // MARK: - Controller Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupVC()
    addSubviews()
  }
  
  
  // MARK: - Private Methods
  private func setupVC() {
    view.backgroundColor = .white
    navigationController?.navigationBar.tintColor = .white
  }
  
  private func addSubviews() {
    view.addSubview(userProfileImage)
    view.addSubview(usernameLabel)
    view.addSubview(forksCountLabel)
    view.addSubview(issuesCountLabel)
    view.addSubview(descriptionLabel)
    
    NSLayoutConstraint.activate([
      userProfileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
      userProfileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      userProfileImage.widthAnchor.constraint(equalToConstant: 60),
      userProfileImage.heightAnchor.constraint(equalToConstant: 60),
      
      usernameLabel.topAnchor.constraint(equalTo: userProfileImage.bottomAnchor, constant: 8),
      usernameLabel.leadingAnchor.constraint(equalTo: userProfileImage.leadingAnchor, constant: 0),
      
      forksCountLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 20),
      forksCountLabel.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
      
      issuesCountLabel.topAnchor.constraint(equalTo: forksCountLabel.bottomAnchor, constant: 8),
      issuesCountLabel.leadingAnchor.constraint(equalTo: forksCountLabel.leadingAnchor),
            
      descriptionLabel.topAnchor.constraint(equalTo: issuesCountLabel.bottomAnchor, constant: 8),
      descriptionLabel.leadingAnchor.constraint(equalTo: issuesCountLabel.leadingAnchor),
      descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
      ])
  }
  
}


















