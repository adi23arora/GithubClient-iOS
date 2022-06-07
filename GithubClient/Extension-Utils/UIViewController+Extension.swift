//
//  UIViewController+Extension.swift
//  GithubClient
//
//  Created by Aditya Arora on 07/06/22.
//

import UIKit

extension UIViewController {
    func presentAlert(title: String,
                      message: String,
                      buttonTitle: String,
                      buttonAction: @escaping () -> Void) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: buttonTitle,
                                          style: .cancel,
                                          handler: { _ in buttonAction()}))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
