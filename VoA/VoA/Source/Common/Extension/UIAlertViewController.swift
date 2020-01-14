//
//  UIAlertViewController.swift
//  VoA
//
//  Created by Jung seoung Yeo on 2020/01/14.
//  Copyright © 2020 Linsaeng. All rights reserved.
//

import UIKit

public extension UIAlertController {

    // alert
    @discardableResult
    static func alert( _ title: String = "", message: String) -> UIAlertController {
        return UIAlertController(title: title,
                                 message: message,
                                 preferredStyle: .alert)
    }

    @discardableResult
    static func alert( _ title: String = "", message: String, cancelString: String, cancelHandler: (() -> Void)? = nil) -> UIAlertController {
        let alertController =  UIAlertController(title: title,
                                                 message: message,
                                                 preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: cancelString,
                                                style: .cancel, handler: { _ in
                                                    cancelHandler?()
        }))
        return alertController
    }

    @discardableResult
    static func alert( _ title: String = "", message: String, defaultString: String, defaultHandler: (() -> Void)? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: defaultString, style: .default, handler: { _ in
            defaultHandler?()
        }))
        return alertController
    }

    @discardableResult
    static func alert( _ title: String = "", message: String, defaultString: String, cancelString: String, defaultHandler: (() -> Void)? = nil, cancelHandler: (() -> Void)? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: defaultString, style: .default, handler: { _ in
            defaultHandler?()
        }))

        alertController.addAction(UIAlertAction(title: cancelString,
                                                style: .cancel,
                                                handler: { _ in
                                                    cancelHandler?()
        }))
        return alertController
    }

    // sheet
    @discardableResult
    static func sheet( _ title: String = "", messgae: String) -> UIAlertController {
        return UIAlertController(title: title,
                                 message: messgae,
                                 preferredStyle: .actionSheet)
    }

    @discardableResult
    static func sheetCancel( _ title: String = "", message: String, cancelString: String, cancalHandler: (() -> Void)? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: cancelString,
                                                style: .cancel, handler: { _ in
                                                    cancalHandler?()
        }))
        return alertController
    }

    @discardableResult
    func sheetConfirm( _ title: String = "", message: String, defaultString: String, defaultHandler: (() -> Void)? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: defaultString,
                                                style: .default, handler: { _ in
                                                    defaultHandler?()
        }))
        return alertController
    }

    @discardableResult
    static func sheet( _ title: String = "", message: String, defualtString: String, cancelString: String, defualtHandler: (() -> Void)? = nil, cancelHandler: (() -> Void)? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: defualtString,
                                                style: .default, handler: { _ in
                                                    defualtHandler?()
        }))

        alertController.addAction(UIAlertAction(title: cancelString,
                                                style: .cancel,
                                                handler: { _ in
                                                    cancelHandler?()
        }))
        return alertController
    }

    @discardableResult
    func show( _ viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) -> UIAlertController {
        if Thread.isMainThread {
            viewController.present(self, animated: animated, completion: completion)
        } else {
            DispatchQueue.main.async {
                viewController.present(self, animated: animated, completion: completion)
            }
        }
        return self
    }
}
