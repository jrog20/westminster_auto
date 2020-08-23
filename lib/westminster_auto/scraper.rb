# require 'nokogiri'
# require 'open-uri'
# require 'pry'

# Avoid scraping data more than once per web page - 
# utilize objects you have already created. It will speed up the program.

class WestminsterAuto::Scraper

  def get_page
    Nokogiri::HTML(open("http://www.westminsterautovt.com/inventory/"))
  end

  def scrape_inventory

    # output = "2007 Ford Focus SE Sedan 4D"
    # iterate over this to get year, make, model
    self.get_page.css(".title.heading-font .rmv_txt_drctn").first.children.text.strip
    #binding.pry

    # year
    # make
    # model


    # mileage
    # price = inventory.css(".price-form-label").children.first.text

  end

  def scrape_inventory_details
    #inventory_details = 

  end
  
end