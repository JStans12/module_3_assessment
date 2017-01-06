class BbService

  def self.get_stores
    response = Faraday.get("https://api.bestbuy.com/v1/stores?format=json&apiKey=a8k7nnexb87aa9hb3zzqbgf7&postalCode=80202&distance=25&pageSize=16")
    parsed = JSON.parse(response.body, symbolize_names: true)[:stores]
  end

end
