//
//  VoAColor.swift
//  VoA
//
//  Created by Jung seoung Yeo on 2020/01/11.
//  Copyright © 2020 Linsaeng. All rights reserved.
//

import UIKit

class VoAColor: NSObject {
    
    struct Style {
        
        static var background: UIColor {
            if #available(iOS 13, *) {
                return .systemBackground
            }
            return .white
        }
        
    }
}
