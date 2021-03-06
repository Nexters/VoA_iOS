//
//  SplashViewModel.swift
//  VoA
//
//  Created by Jung seoung Yeo on 2020/01/13.
//  Copyright © 2020 Linsaeng. All rights reserved.
//

import RxSwift
import RxCocoa

class SplashViewModel: NSObject, ReactiveViewModelable {
    typealias InputType = Input
    typealias OutputType = Output
    
    struct Input {

    }
    
    struct Output {
        
    }
    
    public lazy var input: InputType = Input()
    public lazy var output: OutputType = Output()
    
    private let bag = DisposeBag()
    
    override init() {
        super.init()
        
        rxBind()
    }
    
    private func rxBind() {

    }
    
}
