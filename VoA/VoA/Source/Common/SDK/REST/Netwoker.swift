//
//  Netwoker.swift
//  VoA
//
//  Created by Jung seoung Yeo on 2020/01/14.
//  Copyright © 2020 Linsaeng. All rights reserved.
//

import Alamofire
import RxSwift
import RxCocoa
import SwiftyJSON

protocol Networkerable {
    var route: (method: HTTPMethod, url: URL) { get }
    var params: Parameters? { get }
    var header: HTTPHeaders? { get }
}

public enum APIResult {
    case success(JSON)
    case failure(Error)
}

public final class Networker: NSObject {

    static func request(api: Networkerable, _ parameterEncoding: ParameterEncoding? = nil) -> Single<JSON> {
        return sendRequest(api: api, parameterEncoding: parameterEncoding)
    }

    private static func sendRequest(api: Networkerable, parameterEncoding: ParameterEncoding?) -> Single<JSON> {
        let request = Single<JSON>.create { (single) -> Disposable in
            sendRequestDefault(url: api.route.url.absoluteString,
                               method: api.route.method,
                               params: api.params,
                               parameterEncoding: parameterEncoding,
                               header: api.header,
                               callback: { (HTTPStatus, result) in
                                #if DEBUG
                                    print("Http StatusCode : { \(HTTPStatus?.statusCode ?? -999) }")
                                #endif
                                switch result {
                                case .success(let json):
                                    #if DEBUG
                                        print("JSON : { \(json) }")
                                    #endif
                                    single(.success(json))
                                case .failure(let error):
                                    #if DEBUG
                                        print("ERROR: { \(error.localizedDescription) }")
                                    #endif
                                    single(.error(error))
                                }
            })
            return Disposables.create()
        }
        return request
    }

    private static func sendRequestDefault(url: String, method: HTTPMethod, params: Parameters?, parameterEncoding: ParameterEncoding?, header: HTTPHeaders?, callback: ((HTTPURLResponse?, APIResult) -> Void)?) {

        let url = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)

        var encoding = parameterEncoding

        if method == .post {
            encoding = JSONEncoding.default
        } else if encoding == nil {
            encoding = URLEncoding.default
        }

        var requestHeader = VoAService.shared.restHeader
        
        if let addHeaders = header {
            for header in addHeaders {
                requestHeader.add(header)
            }
        }

        guard let urlString = url, let requestURL = URL(string: urlString) else {
            callback?(nil, .failure(VoAError.urlParsing998))
            return
        }
    
        AF.request(requestURL,
                   method: method,
                   parameters: params,
                   encoding: encoding!,
                   headers: requestHeader)
            .validate(statusCode: 200 ..< 300)
            .responseJSON { (response) in
                switch response.result {
                case .success(let data):
                    if let dictionary = data as? [String: Any] {
                        let json = JSON(dictionary)
                        callback?(response.response, .success(json))
                    } else if let dictionnarys = data as? [[String: Any]] {
                        let jsonArray = JSON(dictionnarys)
                        callback?(response.response, .success(jsonArray))
                    } else {
                        if let statusCode = response.response?.statusCode, let reason = VoAError(rawValue: statusCode) {
                            callback?(response.response, .failure(reason))
                        } else {
                            callback?(response.response, .failure(VoAError.jsonParsing997))
                        }
                    }
                case .failure(let error):
                    if let statusCode = response.response?.statusCode,
                        let reason = VoAError(rawValue: statusCode) {
                        callback?(response.response, .failure(reason))
                    } else {
                        callback?(response.response, .failure(error))
                    }
                }
        }
    }
}
