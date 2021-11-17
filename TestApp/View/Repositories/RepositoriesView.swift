//
//  RepositoriesView.swift
//  TestApp
//
//  Created by Can Akyıldız on 4.11.2021.
//

import UIKit

private let identifier = "RepositoriesViewCell"

class RepositoriesView: UIView, BaseView {
    
    var tableView: UITableView = {
        var tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedRowHeight = 100
        tableView.register(UINib(nibName: "RepositoriesViewCell", bundle: nil), forCellReuseIdentifier: identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadSubviews()
    }
    
    func loadSubviews() {
                
        configureTableView()
                
    }
    
    func configureTableView() {
        
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
