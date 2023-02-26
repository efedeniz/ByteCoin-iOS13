import UIKit

extension ViewController : CurrenyProtocol {
    func fetchData(_ coin: CoinCurreny?) {
        if let response = coin {
            DispatchQueue.main.async {
                let price = String(format: "%.3f", response.rate)
                self.priceLabel.text = price
                self.currencyLabel.text = response.asset_id_quote
            }
        }
    }
    
    func fetchError(_ error: Error) {
        print(error)
    }
}
