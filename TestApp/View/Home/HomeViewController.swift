//
//  HomeViewController.swift
//  TestApp
//
//  Created by Can Akyıldız on 4.11.2021.
//

import UIKit

class HomeViewController: UIViewController {

    var coordinator: HomeCoordinator?
    var disposable: DisposeBag = DisposeBag()
    
    var iconViewTopConstraintConstant: CGFloat {
         if UIScreen.main.bounds.height < 800 {
             return 28
        } else {
            return 120

        }
    }

    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var privacyTermsLabel: UILabel!
    
    @IBOutlet weak var iconViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var iconViewHeightConstraint: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureAnimation()
    }
    
    func configureAnimation() {
        guard iconViewTopConstraint.constant != iconViewTopConstraintConstant else {
            return
        }

        iconViewTopConstraint.constant = iconViewTopConstraintConstant
        iconViewHeightConstraint.constant = 110

        UIView.animate(withDuration: 0.6,
                       delay: 0.3,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.1,
                       options: .curveEaseInOut) { [weak self] in
            guard let self = self else { return }
            self.view.layoutIfNeeded()
        } completion: { [weak self] completion in
            self?.iconViewHeightConstraint.constant = 100

            UIView.animate(withDuration: 2,
                           delay: 0.1,
                           usingSpringWithDamping: 0.3,
                           initialSpringVelocity: 0.2,
                           options: .curveEaseInOut) { [weak self] in
                guard let self = self else { return }
                self.view.layoutIfNeeded()
            } completion: { completion in

            }
        }
    }
    
    func bindView() {
        enterButton.rx.tap.bind {
            self.coordinator?.setRepositoriesViewController()
        }.disposed(by: disposable)
        
        let terms = NSMutableAttributedString(string: "Privacy policy and Terms of use")
        terms.underline("Privacy policy")
        terms.underline("Terms of use")
        privacyTermsLabel.attributedText = terms
        
    }
    
}
