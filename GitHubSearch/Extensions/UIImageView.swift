//
//  UIImageView.swift
//  GitHubSearch
//
//  Created by Vlad Gachi on 21/12/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

extension UIImageView {
  
  static let userProfileImage: UIImageView = {
    let iv                = UIImageView()
    iv.clipsToBounds      = true
    iv.contentMode        = .scaleAspectFill
    iv.layer.cornerRadius = 30 // Half of the image's width
    iv.translatesAutoresizingMaskIntoConstraints = false
    return iv
  }()
  
  func loadImageWith(urlString: String?) {
    guard let urlString = urlString else { return }
    guard let url       = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, _, err) in
      if let fetchErr = err {
        print("Failed to fetch image:", fetchErr)
        return
      }
      
      guard let imageData    = data else { return }
      guard let fetchedImage = UIImage(data: imageData) else { return }
      
      DispatchQueue.main.async {
        self.image = fetchedImage
      }
      
      }.resume()
  }
  
}




















