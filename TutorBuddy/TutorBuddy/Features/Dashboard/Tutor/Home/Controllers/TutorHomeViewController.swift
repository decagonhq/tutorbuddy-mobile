//
//  TutorHomeViewController.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 01/09/2022.
//

import UIKit

class TutorHomeViewController: UIViewController {
    
    fileprivate let homeView = TutorHomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appBackground
        configureViews()
    }
    
    func configureViews() {
        view.addSubview(homeView)
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
