//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "CDDE2CA2-AA86-410B-8285-5EDE81A7C943"
    
    let currencyArray = ["AUD","AZN", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","TL","ZAR"]

    public var delegate : CurrenyProtocol?
    
    public func GetPrice(currency : String) {
        let url = createURLString(currency)
        makeHttpRequest(with: url)
        
    }
    
    private func createURLString(_ curreny : String) -> String {
        let url = "\(baseURL)/\(curreny)/?apikey=\(apiKey)"
        return url
    }
    
    private func makeHttpRequest(with customUrl : String){
        if let url = URL(string: customUrl){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.fetchError(error!)
                }
                
                if let response = data {
                    let coin = self.JsonConverter(jsonResult: response)
                    delegate?.fetchData(coin)
                }
            }
            
            task.resume()
        }
    }
    
    private func JsonConverter(jsonResult : Data) -> CoinCurreny?{
        let decoder = JSONDecoder()
        do{
            let coin = try decoder.decode(CoinCurreny.self, from: jsonResult)
            return coin
        }catch{
            delegate?.fetchError(error)
            return nil
        }
    }
}
