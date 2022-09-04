//
//  NotificationsViewController.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 01/09/2022.
//

import UIKit

final class NotificationsViewController: UIViewController {

    fileprivate let notificationsView = NotificationsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appBackground
        configureViews()
    }
    
    func configureViews() {
        view.addSubview(notificationsView)
        NSLayoutConstraint.activate([
            notificationsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            notificationsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            notificationsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            notificationsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
