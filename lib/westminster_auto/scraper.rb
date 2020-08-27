# Avoid scraping data more than once per web page - 
# utilize objects you have already created. It will speed up the program.
require 'pry'
require 'nokogiri'
require 'open-uri'

module WestminsterAuto
  class Scraper

    def get_page
      Nokogiri::HTML(open("http://www.westminsterautovt.com/inventory/"))
    end

    def get_vehicles  
      get_page.css(".title.heading-font").each do |row|
        v = row.css(".rmv_txt_drctn").first.children.text.strip.split(" ")
        year = v[0]
        make = v[1]
        model = v[2]
        body = v[3..10]

        price = get_page.css(".price-form-label").children.first.text

        transmission = get_page.css(".transmission .value.h5").first.children.text.strip
        drive = get_page.css(".drive .value.h5").first.children.text.strip
        fuel = get_page.css(".fuel .value.h5").first.children.text.strip
        engine = get_page.css(".engine .value.h5").first.children.text.strip
        mileage = get_page.css(".mileage .value.h5").first.children.text.strip

        WestminsterAuto::Vehicle.new(year, make, model, mileage, price)

      end
    end

    def inventory_details
      
      get_page.css(".value.h5").children.collect do |item|
        items = []
        items << item
        items << item.text.strip

        transmission = get_page.css(".transmission .value.h5") 
        #Need to work on scraping data once per car
        #Nokogiri::HTML(open("http://www.westminsterautovt.com/inventory/")).css(".meta-middle-unit.font-exists.fuel")
      end
    end

  end
end