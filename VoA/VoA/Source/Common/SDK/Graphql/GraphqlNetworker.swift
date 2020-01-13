//
//  GraphqlNetworker.swift
//  VoA
//
//  Created by Jung seoung Yeo on 2020/01/13.
//  Copyright © 2020 Linsaeng. All rights reserved.
//

import Apollo
import RxApolloClient
import Alamofire
import RxSwift
import SwiftyJSON
import Foundation

enum GraphQLType {
    case fetch
    case update([GraphQLFile])
}

class GraphqlNetworker: NSObject {
    
    static private var apollo: ApolloClient = {
//        let configuration = URLSessionConfiguration.default
//        configuration.httpAdditionalHeaders = MoinaService.shared.commonHeader
//        let session = URLSession(configuration: configuration)
//        let apollo = ApolloClient(networkTransport: HTTPNetworkTransport(url: MoinaService.shared.apiURL, session: session))
//        return apollo
        return ApolloClient(url: VoAService.shared.apiURL)
    }()

    static func request<Query: GraphQLQuery>(query: Query, type: GraphQLType = .fetch) -> Single<JSON> {
        let single = Single<JSON>.create { single -> Disposable in
            
            switch type {
            case .fetch:
                _ = apollo.rx.fetch(query: query)
                    .subscribe(onSuccess: { (result) in
                        single(.success(JSON(result.jsonObject)))
                    }, onError: { (error) in
                        single(.error(error))
                    })
            case .update(let graphQLFiles):
                _ = apollo.rx.upload(operation: query, files: graphQLFiles)
                    .subscribe(onSuccess: { (result) in
                        
                    }, onError: { (error) in
                        
                    })
            }
            return Disposables.create()
        }
        return single
    }
}
