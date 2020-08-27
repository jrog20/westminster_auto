require 'pry'
require 'nokogiri'
require 'open-uri'

class WestminsterAuto::Vehicle

  attr_accessor :body, :transmission, :drive, :fuel, :engine
  attr_reader :year, :make, :model, :mileage, :price

  @@all = []

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