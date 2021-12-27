//
//  ApiMovie.swift
//  MovieDB
//
//  Created by Ayman Askari on 19/12/21.
//

import Foundation
import Alamofire

class ApiManager {
    static let shareInstance = ApiManager()
    private var movieDB: [DataResults] = []
    func callingMovie(completionHandler: @escaping (DataResults?) -> ()) {
        let headers: HTTPHeaders = [
                    .contentType("application/json")
                ]
            AF.request(urlMovie,headers: headers)
                .validate()
                .responseDecodable(of: DataResults.self) { (response) in
                    debugPrint(response)
                    switch response.result {
                    case .success(let data):
                        do {
                            data
                            if response.response?.statusCode == 200 {
                                completionHandler(data)
                            }else{
                                completionHandler(nil)
                            }
                        }catch {
                            print(error.localizedDescription)
                            completionHandler(nil)
                        }
                    case .failure(let err):
                        print(err.localizedDescription)
                        completionHandler(nil)
                    }
                }
        }
}
