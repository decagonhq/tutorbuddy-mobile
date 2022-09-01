//
//  TutorAccountViewController.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 01/09/2022.
//

import UIKit

class TutorAccountViewController: UIViewController {

    fileprivate let acccoutView = TutorAccountView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appBackground
        configureViews()
    }
    
    func configureViews() {
        view.addSubview(acccoutView)
        NSLayoutConstraint.activate([
            acccoutView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            acccoutView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            acccoutView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            acccoutView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
