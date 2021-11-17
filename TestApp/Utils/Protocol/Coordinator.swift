//
//  Coordinator.swift
//  TestApp
//
//  Created by Can Akyıldız on 4.11.2021.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
