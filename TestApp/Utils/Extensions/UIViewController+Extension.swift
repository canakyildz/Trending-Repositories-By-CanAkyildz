//
//  UIViewController+Extension.swift
//  TestApp
//
//  Created by Can Akyıldız on 6.11.2021.
//

import UIKit

extension UIViewController {
    func configureNavigationBar(withTitle title: String?,titleView: UIView?, backgroundcolor: UIColor,titleColor: UIColor?,prefersLargeTitles: Bool) {
        let apperance = UINavigationBarAppearance()
        apperance.configureWithOpaqueBackground()
        apperance.largeTitleTextAttributes = [.foregroundColor : UIColor.white]
        apperance.titleTextAttributes = [.foregroundColor: titleColor ?? "", .font: UIFont.systemFont(ofSize: 18, weight: .medium)]
        apperance.backgroundColor = backgroundcolor
        apperance.shadowColor = .clear
        
        //main difference btween swift 4 creating this apperance
        navigationController?.navigationBar.standardAppearance = apperance
        navigationController?.navigationBar.compactAppearance = apperance
        navigationController?.navigationBar.scrollEdgeAppearance = apperance
        
        
        navigationController?.navigationBar.prefersLargeTitles = prefersLargeTitles
        navigationItem.title = title ?? ""
        navigationItem.titleView = titleView ?? nil
        navigationItem.titleView?.translatesAutoresizingMaskIntoConstraints = false
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        
        navigationController?.navigationBar.overrideUserInterfaceStyle = .dark
    }
    
    
    func showActivityIndicator() {
        setActivityIndicator()
    }
    
    func hideActivityIndicator() {
        removeActivityIndicator()
    }
    
    func setActivityIndicator() {
        guard !isDisplayingActivityIndicatorOverlay() else { return }
        guard let parentViewForOverlay = view else { return }
        
        //configure overlay
        let overlay = UIView()
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.backgroundColor = UIColor.white
        overlay.alpha = 0.6
        overlay.tag = 999
        
        //configure activity indicator
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.tag = 1_000
        activityIndicator.color = .black
        
        //add subviews
        overlay.addSubview(activityIndicator)
        parentViewForOverlay.addSubview(overlay)
        
        //add overlay constraints
        overlay.heightAnchor.constraint(equalTo: parentViewForOverlay.heightAnchor).isActive = true
        overlay.widthAnchor.constraint(equalTo: parentViewForOverlay.widthAnchor).isActive = true
        
        //add indicator constraints
        activityIndicator.centerXAnchor.constraint(equalTo: overlay.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: overlay.centerYAnchor).isActive = true
        
        //animate indicator
        activityIndicator.startAnimating()
    }
    
    func removeActivityIndicator() {
        let activityIndicator = getActivityIndicator()
        
        if let overlayView = getOverlayView() {
            let animations = {
                overlayView.alpha = 0.0
                activityIndicator?.stopAnimating()
            }
            UIView.animate(withDuration: 0.2, animations: animations) { _ in
                activityIndicator?.removeFromSuperview()
                overlayView.removeFromSuperview()
            }
        }
    }
    
    func isDisplayingActivityIndicatorOverlay() -> Bool {
        if getActivityIndicator() != nil && getOverlayView() != nil {
            return true
        }
        return false
    }
    
    func getActivityIndicator() -> UIActivityIndicatorView? {
        return (view.viewWithTag(1_000)) as? UIActivityIndicatorView
    }
    
    func getOverlayView() -> UIView? {
        return view.viewWithTag(999)
    }
    
}
