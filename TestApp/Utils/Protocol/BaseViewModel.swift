//
//  BaseViewModel.swift
//  TestApp
//
//  Created by Can Akyıldız on 4.11.2021.
//

import Foundation

protocol BaseViewModel {
    
    var disposable: DisposeBag  { get set }

    func viewDidLoad()
}
