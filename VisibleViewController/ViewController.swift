//
//  ViewController.swift
//  VisibleViewController
//
//  Created by Konstantin Yavorskiy on 25.11.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        presentVisibilityAlert()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.presentVisibilityAlert()
        }
    }
    
    private func presentVisibilityAlert() {
        if let visibleViewController = UIApplication.shared.visibleViewController {
            let alert = UIAlertController(title: String(describing: self), message: String(describing: visibleViewController), preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            visibleViewController.present(alert, animated: true)
        }
    }

}

