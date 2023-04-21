//
//  NetworkManager.swift
//  PHN Technology Machine Test
//
//  Created by Mac on 21/04/23.
//

import Foundation
protocol NetworkRepository{
    func getProduct(url : String, completionHandler : @escaping ([Product])->())
}

class NetworkManager : NetworkRepository{
    let urlSession : URLSession
    init() {
        urlSession = URLSession(configuration: .default)
    }
    
    func getProduct(url : String, completionHandler : @escaping ([Product])->()){
        guard let urlString = URL(string: url) else {return}
        let task = urlSession.dataTask(with: urlString) { (data, response, error) in
            if error == nil{
                guard let data = data else{return}
                do{
                    let product = try JSONDecoder().decode([Product].self, from: data)
                    completionHandler(product)
                }catch let error{
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }

}
