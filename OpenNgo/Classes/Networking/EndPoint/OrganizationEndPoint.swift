////
////  EndPoint.swift
////  OpenNgo
////
////  Created by Sergey Krutikov on 13.04.2018.
////  Copyright © 2018 Sergey Krutikov. All rights reserved.
////
//
//import Foundation
//
//
//enum NetworkEnvironment {
//    case production
//    case staging
//}
//
//public enum MovieApi {
//    case recommended(id:Int)
//    case popular(page:Int)
//    case newMovies(page:Int)
//    case video(id:Int)
//}
//
//extension MovieApi: EndPointType {
//    
//    var environmentBaseURL : String {
//        switch NetworkManager.environment {
//        case .production: return "http://openngo.ru/api/"
//        case .staging: return "http://openngo.ru/api/"
//        }
//    }
//    
//    var baseURL: URL {
//        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
//        return url
//    }
//    
//    var path: String {
//        switch self {
//        case .recommended(let id):
//            return "\(id)/recommendations"
//        case .popular:
//            return "popular"
//        case .newMovies:
//            return "now_playing"
//        case .video(let id):
//            return "\(id)/videos"
//        }
//    }
//    
//    var httpMethod: HTTPMethod {
//        return .get
//    }
//    
//    var task: HTTPTask {
//        switch self {
//        case .newMovies(let page):
//            return .requestParameters(bodyParameters: nil,
//                                      bodyEncoding: .urlEncoding,
//                                      urlParameters: ["page":page,
//                                                      "api_key":NetworkManager.MovieAPIKey])
//        default:
//            return .request
//        }
//    }
//    
//    var headers: HTTPHeaders? {
//        return nil
//    }
//}
//
