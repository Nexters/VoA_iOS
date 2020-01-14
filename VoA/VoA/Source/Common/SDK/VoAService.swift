//
//  VoAService.swift
//  VoA
//
//  Created by Jung seoung Yeo on 2020/01/13.
//  Copyright © 2020 Linsaeng. All rights reserved.
//

import Alamofire

class VoAService: NSObject {

    public var commonHeader: [AnyHashable : Any] {
        var headers = [AnyHashable : Any]()
        headers[""] = ""
        return headers
    }
    
    public var restHeader: HTTPHeaders {
        var headers = HTTPHeaders()
        headers[""] = ""
        return headers
    }
    
    //http://localhost:4000
    public var apiURL: URL {
        return URL(string: "")!
    }

    public static let shared = VoAService()

    private override init() {
        super.init()
    }
}
