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
  
  let userProfileImage: UIImageView = {
    let iv                = UIImageView()
    iv.clipsToBounds      = true
    iv.contentMode        = .scaleAspectFill
    iv.layer.cornerRadius = 30 // Half of the image's width
    iv.translatesAutoresizingMaskIntoConstraints = false
    return iv
  }()
  
  let usernameLabel: UILabel = {
    let label   = UILabel()
    label.font  = UIFont.boldSystemFont(ofSize: 16)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let forksCountLabel: UILabel = {
    let label            = UILabel()
    label.font           = UIFont.systemFont(ofSize: 14)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let issuesCountLabel: UILabel = {
    let label            = UILabel()
    label.font           = UIFont.systemFont(ofSize: 14)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let descriptionLabel: UILabel = {
    let label            = UILabel()
    label.numberOfLines  = 0
    label.font           = UIFont.systemFont(ofSize: 14)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  
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


















