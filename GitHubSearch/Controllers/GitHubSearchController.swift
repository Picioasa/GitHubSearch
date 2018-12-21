//
//  GitHubSearchController.swift
//  GitHubSearch
//
//  Created by Vlad Gachi on 21/12/2018.
//  Copyright © 2018 Vlad Gachi. All rights reserved.
//

import UIKit

class GitHubSearchController: UITableViewController, UISearchBarDelegate {
  
  // MARK: - Properties
  private var searchResults = [Item]()
  
  private let cellId = "cellId"
  
  private let searchController  = UISearchController.searchController
  private let pullToSearchLabel = UILabel.pullToSearchLabel
  
  
  // MARK: - Controller Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupVC()
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    fetchData(for: searchText)
  }
  
  
  // MARK: - Private Methods
  private func setupVC() {
    // Setup tableView
    tableView.backgroundColor = .white
    tableView.tableFooterView = pullToSearchLabel
    tableView.register(GitHubSearchCell.self, forCellReuseIdentifier: cellId)
    // Setup navigationBar
    navigationItem.title = "GitHub Search"
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.navigationBar.barTintColor = .black
    navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    navigationItem.searchController = searchController
    // Set search bar's delegate
    searchController.searchBar.delegate = self
  }
  
  private func fetchData(for text: String)  {
    let urlString = "https://api.github.com/search/repositories?q=\(text)"
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, _, err) in
      if let fetchErr = err {
        print("Failed to fetch data:", fetchErr)
      }
      
      guard let fetchedData = data else { return }
      
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase

      do {
        let decodedData = try decoder.decode(Result.self, from: fetchedData)

        self.searchResults = decodedData.items

        DispatchQueue.main.async {
          self.pullToSearchLabel.isHidden = true
          self.tableView.reloadData()
        }

      } catch let jsonErr {
        print("Failed to decode json:", jsonErr)
      }
      
    }.resume()
  }

}


// MARK: - TableView DataSource & Delegate
extension GitHubSearchController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return searchResults.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell    = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! GitHubSearchCell
    let result  = searchResults[indexPath.row]
    cell.result = result
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let result               = searchResults[indexPath.row]
    let detailsController    = DetailsViewController()
    detailsController.result = result
    navigationController?.pushViewController(detailsController, animated: true)
  }
}












