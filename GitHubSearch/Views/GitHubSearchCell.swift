//
//  GitHubSearchCell.swift
//  GitHubSearch
//
//  Created by Vlad Gachi on 21/12/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

class GitHubSearchCell: UITableViewCell {
  
  
  // MARK: - Properties
  var result: Item? {
    didSet {
      guard let result = result else { return }
      nameLabel.text        = result.name
      descriptionLabel.text = result.description
    }
  }
  
  let nameLabel: UILabel = {
    let label   = UILabel()
    label.font  = UIFont.boldSystemFont(ofSize: 14)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let descriptionLabel: UILabel = {
    let label         = UILabel()
    label.textColor   = .darkGray
    label.font        = UIFont.systemFont(ofSize: 14)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  
  // MARK: - Object Lifecycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubviews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  // MARK: - Private Methods
  private func addSubviews() {
    addSubview(nameLabel)
    addSubview(descriptionLabel)
    
    NSLayoutConstraint.activate([
      nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
      nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
      
      descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
      descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 0),
      descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
      ])
  }
}






















