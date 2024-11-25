//
//  UIApplication+Extension.swift
//  VisibleViewController
//
//  Created by Konstantin Yavorskiy on 25.11.2024.
//

import UIKit

extension UIApplication {
    
    var visibleViewController: UIViewController? {
        guard let scene = connectedScenes.first,
              let delegate = scene.delegate as? SceneDelegate,
              let window = delegate.window,
              let rootViewController = window.rootViewController else { return nil }
        return getVisibleViewController(for: rootViewController)
    }
    
    private func getVisibleViewController(for viewController: UIViewController) -> UIViewController? {
        guard viewController.viewIfLoaded?.window != nil else {
            return nil
        }
        if let presentedViewController = viewController.presentedViewController {
            return getVisibleViewController(for: presentedViewController)
        }
        if let navigationController = viewController as? UINavigationController {
            if let visibleViewController = navigationController.visibleViewController {
                return getVisibleViewController(for: visibleViewController)
            }
        }
        if let tabBarController = viewController as? UITabBarController {
            if let selectedViewController = tabBarController.selectedViewController {
                return getVisibleViewController(for: selectedViewController)
            }
        }
        return viewController
    }
    
}
