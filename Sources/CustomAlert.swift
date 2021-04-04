//
//  CustomAlert.swift
//
//  Created by Christina on 4/2/21.
//  Copyright © 2021 Tealium. All rights reserved.
//

import SwiftUI

// Workaround until SwiftUI adds text fields to alerts 🤞
public func customSaveAlert(_ completion: @escaping (String) -> Void) {
    let attributedTitle = NSAttributedString(string: "Please Verify Your Account", attributes: [
        NSAttributedString.Key.foregroundColor : UIColor(hex: "#007DC2")
    ])
    let alert = UIAlertController(title: "", message: nil, preferredStyle: .alert)
    alert.view.tintColor = UIColor(hex: "#007DC2")
    alert.setValue(attributedTitle, forKey: "attributedTitle")
    alert.addTextField() { textField in
        textField.superview?.backgroundColor = UIColor.black
        textField.superview?.superview?.subviews[0].removeFromSuperview()
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Code From Email",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: "#ffffff"),
                                                                          NSAttributedString.Key.backgroundColor: UIColor.black])
    }
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in })
    alert.addAction(UIAlertAction(title: "Enter", style: .default) { _ in
        guard let name = alert.textFields![0].text else {
            return
        }
        completion(name)
    })
    showAlert(alert: alert)
}

private func showAlert(alert: UIAlertController) {
    if let controller = topMostViewController() {
        controller.present(alert, animated: true)
        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
        subview.layer.cornerRadius = 10
        subview.backgroundColor = UIColor(hex: "#2D2D2F")
    }
}

private func keyWindow() -> UIWindow? {
    return UIApplication.shared.connectedScenes
    .filter {$0.activationState == .foregroundActive}
    .compactMap {$0 as? UIWindowScene}
    .first?.windows.filter {$0.isKeyWindow}.first
}

private func topMostViewController() -> UIViewController? {
    guard let rootController = keyWindow()?.rootViewController else {
        return nil
    }
    return topMostViewController(for: rootController)
}

private func topMostViewController(for controller: UIViewController) -> UIViewController {
    if let presentedController = controller.presentedViewController {
        return topMostViewController(for: presentedController)
    } else if let navigationController = controller as? UINavigationController {
        guard let topController = navigationController.topViewController else {
            return navigationController
        }
        return topMostViewController(for: topController)
    } else if let tabController = controller as? UITabBarController {
        guard let topController = tabController.selectedViewController else {
            return tabController
        }
        return topMostViewController(for: topController)
    }
    return controller
}
