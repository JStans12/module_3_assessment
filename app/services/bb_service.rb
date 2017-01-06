class BbService

  def self.get_stores(zip)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeId,storeType,phone,distance,longName,city,region&apiKey=a8k7nnexb87aa9hb3zzqbgf7&pageSize=15")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def self.by_id(id)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(storeId=#{id})?format=json&show=storeId,hours,address,longName,storeType,phone,name,city,region&apiKey=a8k7nnexb87aa9hb3zzqbgf7")
    parsed = JSON.parse(response.body, symbolize_names: true)[:stores][0]
  end
end
