//
//  SplashViewController.swift
//  VoA
//
//  Created by Jung seoung Yeo on 2020/01/11.
//  Copyright © 2020 Linsaeng. All rights reserved.
//

import UIKit

import SwiftlyIndicator
import RxSwift
import RxCocoa

class SplashViewController: BaseViewController {
    
    static func instance() -> BaseViewController {
        return SplashViewController()
    }
    
    private lazy var splashView: SplashView = {
        let splashView = SplashView()
        return splashView
    }()
    
    private let viewModel = SplashViewModel()
    private let bag = DisposeBag()
    
    override func setup() {
        super.setup()
        
        view = splashView
        addIndicator(view: splashView)
    }
    
    override func bind() {
        super.bind()
    }
}
