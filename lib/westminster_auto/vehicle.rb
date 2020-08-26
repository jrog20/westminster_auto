class WestminsterAuto::Vehicle

  attr_accessor 
  attr_reader :year, :make, :model, :mileage, :price

  @@all = []

  def self.new # needs to use object from CLI class as argument?
    self.new(
      WestminsterAuto::Scraper.inventory_basics[0],
      WestminsterAuto::Scraper.inventory_basics[1],
      WestminsterAuto::Scraper.inventory_basics[2],
      # need to get mileage code,
      WestminsterAuto::Scraper.price
      )
  end

  def initialize(year=nil, make=nil, model=nil, mileage=nil, price=nil)
    @year = year
    @make = make
    @model = model
    @mileage = mileage
    @price = price
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end



end