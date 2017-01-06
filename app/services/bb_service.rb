class BbService

  def self.get_stores(zip)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeId,storeType,phone,distance,longName,city,region&apiKey=a8k7nnexb87aa9hb3zzqbgf7&pageSize=15")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end
