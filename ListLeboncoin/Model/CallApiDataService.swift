//
//  CallApiDataService.swift
//  ListLeboncoin
//
//  Created by Sylla on 30/04/2022.
//

import Foundation
class CallApiDataService {
    static let shared = CallApiDataService()
    private init(){}
    
    private var task: URLSessionDataTask?
    private var session = URLSession(configuration: .default)
    
    func getAnnonce(callback: @escaping (Result<[Ads]?,ErrorCasesCallApi>)->Void){
        guard let url = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json") else{
            return
        }
        //print("making api call...")
        
        var request = URLRequest(url: url)

        task = session.dataTask(with: request) { data, _ , error in
            DispatchQueue.main.async {
                
                guard let data = data, error == nil else {
                                return callback(.failure(.errorNetwork))
                            }
                            
                            guard let responseJson = try? JSONDecoder().decode([Ads].self, from: data) else{
                                return callback(.failure(.errorJsonData))
                            }
                callback(.success(responseJson))
            }
            
            
        }
        task?.resume()
       
    }
 
}
