require 'pry'
require 'nokogiri'
require 'open-uri'

module WestminsterAuto
  class Vehicle

    attr_reader :year, :make, :model, :mileage, :price, :body, :transmission, :drive, :fuel, :engine

    @@all = []

    def initialize(year=nil, make=nil, model=nil, mileage=nil, price=nil, body=nil, transmission=nil, drive=nil, fuel=nil, engine=nil)
      @year = year
      @make = make
      @model = model
      @mileage = mileage
      @price = price
      @body = body
      @transmission = transmission
      @drive = drive
      @fuel = fuel
      @engine = engine
      @@all << self
    end

    def self.all
      @@all
    end

    def self.find(id)
      self.all[id-1]
    end

  end
end