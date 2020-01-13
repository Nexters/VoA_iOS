//
//  ReactiveViewModelable.swift
//  VoA
//
//  Created by Jung seoung Yeo on 2020/01/13.
//  Copyright © 2020 Linsaeng. All rights reserved.
//

protocol ReactiveViewModelable {
    associatedtype InputType
    associatedtype OutputType
    
    var input: InputType { set get }
    var output: OutputType { get }
}
