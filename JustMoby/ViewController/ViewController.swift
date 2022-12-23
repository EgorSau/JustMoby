//
//  ViewController.swift
//  JustMoby
//
//  Created by Egor SAUSHKIN on 22.12.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: Private Properties
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    // MARK: Private
    
    private func setupView(){
        self.view.backgroundColor = .white
        self.navigationController?.title = "Home"
        self.view.largeContentTitle = "Home"
        
        self.view.addSubview(self.tableView)
        
        let topTableConstraint = self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let leadingTableConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingTableConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomTableConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        NSLayoutConstraint.activate([
            topTableConstraint,
            leadingTableConstraint,
            trailingTableConstraint,
            bottomTableConstraint
        ])
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 0
        case 1:
            return 7
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as? TableViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                return cell
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return BannersCollection()
        case 1...7:
            let categoryView = CategoryView()
            categoryView.setupNumber(forSection: section)
            return categoryView
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 112
        case 1:
            return 50
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 0
        case 1:
            return 112
        default:
            return 0
        }
    }
}
