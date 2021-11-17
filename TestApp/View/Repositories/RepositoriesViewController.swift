//
//  RepositoriesViewController.swift
//  TestApp
//
//  Created by Can Akyıldız on 4.11.2021.
//

import UIKit

private let identifier = "RepositoriesViewCell"


class RepositoriesViewController: UIViewController, BaseViewController {
    
    
    var coordinator: HomeCoordinator?
    var disposable: DisposeBag = DisposeBag()
    var viewModel: RepositoriesViewModel = RepositoriesViewModel()
    var presentationView: RepositoriesView = RepositoriesView()
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        bindView()
        viewModel.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        
        configureNavigationBar(withTitle: "Trending Repositories", titleView: nil, backgroundcolor: Colors.canoGray.color, titleColor: .white, prefersLargeTitles: true)
        
    }
        
    func bindView() {
                
        viewModel.dataSource
            .bind(
                to: presentationView
                    .tableView
                    .rx
                    .items(
                        cellIdentifier: identifier,
                        cellType: RepositoriesViewCell.self
                    )
            ) { row, data, cell in
                cell.selectionStyle = .none
                cell.backgroundColor = Colors.canoGray.color
                cell.config(model:data)
            }.disposed(by: disposable)
        
        presentationView.tableView.rx.itemSelected.bind { index in
            let value = self.viewModel.dataSource.value[index.row]
            self.coordinator?.setRepositoryDetailController(withRepository: value)
        }.disposed(by: disposable)

        
    }
}
