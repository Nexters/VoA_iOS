//
//  SplashViewController.swift
//  VoA
//
//  Created by Jung seoung Yeo on 2020/01/11.
//  Copyright © 2020 Linsaeng. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class SplashViewController: BaseViewController {
    
    private lazy var splashNode: SplashNode = {
        let node = SplashNode()
        return node
    }()
    
    private let viewModel = SplashViewModel()
    private let bag = DisposeBag()
    
    override func setup() {
        super.setup()
        
        view = splashNode.view
    }
    
    override func bind() {
        super.bind()
    }
}
