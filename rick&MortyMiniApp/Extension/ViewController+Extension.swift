//
//  ViewController+Extension.swift
//  rick&MortyMiniApp
//
//  Created by Mikhayl Romanovsky on 2023/8/18.
//

import Foundation
import UIKit
fileprivate var activeViewMain: UIView?

extension UIViewController {
    func startWaitingIndicator() {
        activeViewMain = UIView()
        guard let activeView = activeViewMain else { return }
        activeView.backgroundColor = UIColor(named: "arrayButtonColor")
        activeView.translatesAutoresizingMaskIntoConstraints = false
        let activeIndicator = UIActivityIndicatorView()
        activeIndicator.translatesAutoresizingMaskIntoConstraints = false
        activeIndicator.startAnimating()
        activeView.addSubview(activeIndicator)
        NSLayoutConstraint.activate([
            activeIndicator.topAnchor.constraint(equalTo: activeView.topAnchor),
            activeIndicator.leadingAnchor.constraint(equalTo: activeView.leadingAnchor),
            activeIndicator.bottomAnchor.constraint(equalTo: activeView.bottomAnchor),
            activeIndicator.trailingAnchor.constraint(equalTo: activeView.trailingAnchor)
        ])
        view.addSubview(activeView)
        activeViewMain = activeView
        NSLayoutConstraint.activate([
            activeView.topAnchor.constraint(equalTo: view.topAnchor),
            activeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            activeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            activeView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        
    }
    func stopWaitingIndicatore() {
        activeViewMain?.removeFromSuperview()
        activeViewMain = nil
    }
}
