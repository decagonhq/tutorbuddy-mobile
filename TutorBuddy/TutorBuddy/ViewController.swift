//
//  ViewController.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 16/07/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UILabel().apply {
            $0.text = "hello world"
            $0.animateViewOnTapGesture { [weak self] in
                self?.dismissViewController()
            }
            with($0) {
                addSubview($0)
                $0.centerInSuperview()
            }
        }
    }


}

