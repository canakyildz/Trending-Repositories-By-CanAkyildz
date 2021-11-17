//
//  HomeCoordinator.swift
//  TestApp
//
//  Created by Can Akyıldız on 4.11.2021.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        setInitalControllers()
    }
    
    func setRepositoriesViewController() {
        let vc = RepositoriesViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)

    }
    
    func setRepositoryDetailController(withRepository repository: Repository) {
        let vc = RepositoryDetailViewController(nibName: "RepositoryDetailViewController", bundle: nil)
        vc.coordinator = self
        vc.viewModel.setRepository(repository)
        navigationController.pushViewController(vc, animated: true)
        
    }
    
    func setInitalControllers(){
        let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
