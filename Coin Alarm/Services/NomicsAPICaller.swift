//
//  NomicsAPICaller.swift
//  Coin Alarm
//
//  Created by Владислав Семенец on 15.03.2022.
//

import Foundation


final class NomicsAPICaller {
    static let shared = NomicsAPICaller()
    
    private struct Constants {
        static let apiKey = "bf1308ceb34c53e3d8b0f978df5d72320ade91a1"
        static let assetsEndpoint = "https://api.nomics.com/v1/currencies/"
    }
    
    private init() {
        
    }
    
    public func getAllCyproData(complition: @escaping (Result<[Crypto], Error>) -> Void){
        
        guard let url = URL(string: Constants.assetsEndpoint + "ticker?key=" + Constants.apiKey + "&ranks=1&interval=1d,30d&convert=USD&per-page=10&page=1") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data , error == nil else {return}
        
        
        do{
            let jsonResult =  try JSONDecoder().decode([Crypto].self, from: data)
            complition(.success(jsonResult))
        }
        catch{
            complition(.failure(error))
            }
        }
        task.resume()
    }
}
