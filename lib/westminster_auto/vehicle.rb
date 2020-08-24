class WestminsterAuto::Vehicle

  attr_accessor :year, :make, :model, :mileage, :price

  @@all = []

  def initialize(year=nil, make=nil, model=nil, mileage=nil, price=nil)
    @year = WestminsterAuto::Scraper.inventory_basics[0]
    @make = make
    @model = model
    @mileage = mileage
    @price = WestminsterAuto::Scraper.price
    @@all << self
    #binding.pry
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end



end