//
//  UILabel.swift
//  GitHubSearch
//
//  Created by Vlad Gachi on 21/12/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

extension UILabel {
  
  static let pullToSearchLabel: UILabel = {
    let label           = UILabel()
    label.frame         = CGRect(x: 0, y: 0, width: 250, height: 50)
    label.text          = "Pull to search"
    label.textAlignment = .center
    return label
  }()
  
  static func createLabelWith(font: UIFont) -> UILabel {
    let label           = UILabel()
    label.font          = font
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }
  
  static func createLabelWith(font: UIFont, textColor: UIColor) -> UILabel {
    let label           = UILabel()
    label.font          = font
    label.textColor     = textColor
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }
}

















