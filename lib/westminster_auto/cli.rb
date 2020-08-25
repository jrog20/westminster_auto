class WestminsterAuto::CLI

  def call
    # Need to create this method in Scraper class
    #WestminsterAuto::Scraper.new.make_vehicles
    puts "Welcome to the Westminster Auto available vehicle list"
    start
  end

  def start
    print_vehicles
    puts "What number vehicle would you like to see more information on?"
    input = gets.strip.to_i
    vehicle = WestminsterAuto::Vehicle.find(input.to_i)
    print_vehicle_details(vehicle)

    puts "Would you like to see another vehicle? Enter Y or N"
    input = gets.strip.downcase

    if input == "y"
      start
    elsif input == "n"
      puts "Have a great day!"
      exit
    else
      puts "Let me show you our current inventory."
      start
    end
  end

  def print_vehicles(vehicle)
    #figure out how to get index here
    #puts "#{vehicle.index}"
    puts "#{vehicle.year}"
    puts "#{vehicle.make}"
    puts "#{vehicle.model}"
    puts "#{vehicle.mileage}"
    puts "#{vehicle.price}"
  end

  def print_vehicle_details(from_input)
    puts "#{vehicle.body}"
    puts "#{vehicle.transmission}"
    puts "#{vehicle.drive}"
    puts "#{vehicle.fuel}"
    puts "#{vehicle.engine}"
  end

end