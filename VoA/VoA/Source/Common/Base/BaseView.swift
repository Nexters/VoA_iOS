//
//  BaseView.swift
//  VoA
//
//  Created by Jung seoung Yeo on 2020/01/14.
//  Copyright © 2020 Linsaeng. All rights reserved.
//

import UIKit

protocol BaseViewable {
    func setup()
    func setupUI()
}

class BaseView: UIView, BaseViewable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        setupUI()
    }
    
    func setup() {
        backgroundColor = VoAColor.Style.background
    }
    func setupUI() { }
    
}
