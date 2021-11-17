//
//  RepositoryDetailViewController.swift
//  TestApp
//
//  Created by Can Akyıldız on 5.11.2021.
//

import UIKit

class RepositoryDetailViewController: UIViewController {
    
    var coordinator: HomeCoordinator?
    var disposable: DisposeBag = DisposeBag()
    var viewModel: RepositoryDetailViewModel = RepositoryDetailViewModel()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    
    @IBOutlet weak var titleImage: UIImageView!
    
    @IBOutlet weak var forksImage: UIImageView!
    @IBOutlet weak var starsImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        config()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(handleDismissal))
        configureNavigationBar(withTitle: "", titleView: nil, backgroundcolor: .clear, titleColor: .white, prefersLargeTitles: false)
    }
    
    @objc func handleDismissal() {
        dismiss(animated: true, completion: nil)
    }
    
    func config() {
        titleLabel.text = viewModel.getTitle()
        descriptionLabel.text = viewModel.getDescription()
        starsLabel.text = viewModel.getStarsCount()
        forksLabel.text = viewModel.getForksCount()
        languageLabel.text = viewModel.getLanguage()
        
    }
}



