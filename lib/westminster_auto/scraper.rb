require 'pry'
require 'nokogiri'
require 'open-uri'

module WestminsterAuto
  class Scraper

    def self.get_page
      Nokogiri::HTML(open("http://www.westminsterautovt.com/inventory/"))      
    end

    def self.get_vehicles  

        self.get_page.css(".content").each do |row|
        v = row.css(".title.heading-font .rmv_txt_drctn").first.children.text.strip.split(" ")
        year = v[0]
        make = v[1]
        model = v[2]
        body = v[3..10].join(" ")

        price = row.css(".price .heading-font").children.text

        transmission = row.css(".transmission .value.h5").first.children.text.strip
        drive = row.css(".drive .value.h5").first.children.text.strip
        fuel = row.css(".fuel .value.h5").first.children.text.strip
        engine = row.css(".engine .value.h5").first.children.text.strip
        mileage = row.css(".mileage .value.h5").first.children.text.strip
        
        WestminsterAuto::Vehicle.new(year, make, model, mileage, price, body, transmission, drive, fuel, engine)
      end
      
    end

  end
end