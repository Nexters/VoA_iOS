//
//  ExtensionUIView.swift
//  VoA
//
//  Created by Jung seoung Yeo on 2020/01/14.
//  Copyright © 2020 Linsaeng. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
