//
//  BaseViewController.swift
//  TestApp
//
//  Created by Can Akyıldız on 4.11.2021.
//

import UIKit

protocol BaseViewController {
    
    associatedtype View: BaseView
    associatedtype ViewModel: BaseViewModel
    associatedtype Navigation: Coordinator
    
    var coordinator: Navigation? { get set }
    var disposable: DisposeBag { get set }
    
    var viewModel: ViewModel { get set }
    var presentationView: View { get set }
    
    func bindView()
    
}
