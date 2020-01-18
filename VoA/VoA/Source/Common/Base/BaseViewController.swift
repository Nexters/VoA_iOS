//
//  BaseViewController.swift
//  VoA
//
//  Created by Jung seoung Yeo on 2020/01/13.
//  Copyright © 2020 Linsaeng. All rights reserved.
//

import UIKit

import SwiftlyIndicator

protocol BaseViewControllerable {
    func setup()
    func bind()
    func addIndicator(view: BaseView)
    func handleError(error: Error?)
}

class BaseViewController: UIViewController, BaseViewControllerable {
    
    lazy var refreshControl: UIRefreshControl = {
        var control = UIRefreshControl()
        control.addTarget(self, action: #selector(handleRefresh(_:)), for: UIControl.Event.valueChanged)
        return control
    }()
    
    var indicator: SwiftlyIndicator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        bind()
    }
    
    func setup() { }
    func bind() { }
    func handleError(error: Error?) { }
    
    func addIndicator(view: BaseView) {
        indicator = SwiftlyIndicator(view)
    }
    
    @objc
    func handleRefresh(_ sender: UIRefreshControl) { }
    
    override open func present(_ viewControllerToPresent: UIViewController,
                               animated flag: Bool,
                               completion: (() -> Void)? = nil) {
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
}
