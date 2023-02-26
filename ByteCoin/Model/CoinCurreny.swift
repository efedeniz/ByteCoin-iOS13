class CoinCurreny : Codable {
    public var time : String
    public var asset_id_base : String
    public var asset_id_quote : String
    public var rate : Double
    
    init(time: String, asset_id_base: String, asset_id_quote: String, rate: Double) {
        self.time = time
        self.asset_id_base = asset_id_base
        self.asset_id_quote = asset_id_quote
        self.rate = rate
    }
}
