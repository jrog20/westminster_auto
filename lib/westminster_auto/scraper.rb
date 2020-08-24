# Avoid scraping data more than once per web page - 
# utilize objects you have already created. It will speed up the program.

class WestminsterAuto::Scraper

  def get_page
    Nokogiri::HTML(open("http://www.westminsterautovt.com/inventory/"))
  end

  def individual_vehicle_page
    # output = "http://www.westminsterautovt.com/listings/2007-ford-focus-se-sedan-4d/"
    get_page.css(".title.heading-font .rmv_txt_drctn").first.values[0]

    # iterate over get_page.css(".title.heading-font .rmv_txt_drctn").values[0] to get each individual page?

    

    # other attempts
    #Nokogiri::HTML(open("http://www.westminsterautovt.com/inventory/")).css(".title.heading-font a")
    #Nokogiri::HTML(open("http://www.westminsterautovt.com/inventory/")).css(".stm-isotope-sorting stm-isotope-sorting-list")

  end

  # USE individual_vehicle_page TO GET ALL VEHICLE DETAILS

  def individual_vehicle_details
    details = Nokogiri::HTML(open(individual_vehicle_page))
    
    Nokogiri::HTML(open("http://www.westminsterautovt.com/listings/2007-ford-focus-se-sedan-4d/")).css(".single-car-data td.t-value.h6").children.each do |data|
      data
      puts "#{data}"
    end

    binding.pry
    
    # output = [#<Nokogiri::XML::Text:0x3fcb86dcde1c "Sedan">, #<Nokogiri::XML::Text:0x3fcb86dcddcc "Ford">, #<Nokogiri::XML::Text:0x3fcb86dcdd7c "2007">, #<Nokogiri::XML::Text:0x3fcb86dcdcdc "Automatic">, #<Nokogiri::XML::Text:0x3fcb86dcdc8c "FWD">, #<Nokogiri::XML::Text:0x3fcb86dcdc3c "Gasoline">, #<Nokogiri::XML::Text:0x3fcb86dcdbec "Black">, #<Nokogiri::XML::Text:0x3fcb86dcdb9c "4 Cyl, 2.0L Automatic">, #<Nokogiri::XML::Text:0x3fcb86dcdb4c "173186">, #<Nokogiri::XML::Text:0x3fcb86dcdad4 "1FAFP34N67W288424">]
    details.css(".single-car-data td.t-value.h6").children
    
    # output = "SedanFord2007AutomaticFWDGasolineBlack4 Cyl, 2.0L Automatic1731861FAFP34N67W288424"
    details.css(".single-car-data td.t-value.h6").children.text

    # Nokogiri::HTML(open("http://www.westminsterautovt.com/listings/2007-ford-focus-se-sedan-4d/")).css(".single-car-data td.t-value.h6")
  end

  ############################

  def inventory_basics

    # output = ["2007", "Ford", "Focus", "SE", "Sedan", "4D"]
    self.get_page.css(".title.heading-font .rmv_txt_drctn").first.children.text.strip.split(" ")
    # year = inventory_basics[0]
    # make = inventory_basics[1]
    # model = inventory_basics[2]
    # body = inventory_basics[4]
  end

    # mileage

  def price
    price = get_page.css(".price-form-label").children.first.text
  end

  def scrape_inventory_details
    #inventory_details = 

  end

  # Additional (secondary) details
  # Body-done
  # Transmission
  # Drive
  # Fuel
  # Exterior Color
  # Engine

end