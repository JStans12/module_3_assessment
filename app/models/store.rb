require './app/services/bb_service.rb'

class Store
  def initialize(data)
    @data = data
  end

  def store_type
    @data[:storeType]
  end

  def long_name
    @data[:longName]
  end

  def city
    @data[:city]
  end

  def state
    @data[:region]
  end

  def phone
    @data[:phone]
  end

  def self.by_zip(zip)
    response = BbService.get_stores(zip)
    total = response[:total]
    stores = response[:stores].map do |store|
      Store.new(store)
    end
    return [total, stores]
  end
end
