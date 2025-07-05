//
//  ExchangeRate.swift
//  Shopify-IOS
//
//  Created by Macos on 04/07/2025.
//

import Foundation

struct ExchangeRate: Codable {
let conversion_rate: Double
let base_code: String
let target_code: String
    
}

final class ExchangeRateService{
    static let apiKey = "87ed870b9c20361aabe89196"
    
    static func fetchExchangeRate(from base: String,to target:String, completion:@escaping(Double?) ->Void){
        let urlString =  "https://v6.exchangerate-api.com/v6/\(apiKey)/pair/\(base)/\(target)"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url){ data , response , error in
            guard let data = data,
                  error == nil,
                  let response = try? JSONDecoder().decode(ExchangeRate.self, from: data)
            else{
                completion(nil)
                return
            }
            completion(response.conversion_rate)
            
        }.resume()
    }
}
