//
//  RepositoriesViewCell.swift
//  TestApp
//
//  Created by Can Akyıldız on 4.11.2021.
//

import UIKit


class RepositoriesViewCell: UITableViewCell {
       

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
        

    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = ""
        starsLabel.text = ""
        descriptionLabel.text = ""

        forksLabel.text = ""
        languageLabel.text = ""
    }

    func config(model: Repository) {
        titleLabel.text = "\(model.owner) / \(model.name)"
        descriptionLabel.text = model.repoDescription
        starsLabel.text = "\(model.starsCount)"
        forksLabel.text = "\(model.forksCount)"
        languageLabel.text = model.language
    }
}

