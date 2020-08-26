class WestminsterAuto::CLI

  def call
    # Need to create this method in Scraper class
    #WestminsterAuto::Scraper.new.make_vehicles
    puts "Welcome to the Westminster Auto available vehicle list"
    binding.pry
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
    WestminsterAuto::Vehicle.all.each_with_index do |vehicle, index|
    puts "#{index}."
    puts "#{vehicle.year} #{vehicle.make} #{vehicle.model}"
    puts "Mileage: #{vehicle.mileage}"
    puts "Price: #{vehicle.price}"
  end

  def print_vehicle_details(input)
    WestminsterAuto::Vehicle.all[input.to_i-1]
    puts "#{vehicle.year} #{vehicle.make} #{vehicle.model}"
    puts "Mileage: #{vehicle.mileage}"
    puts "Price: #{vehicle.price}"
    puts ""
    puts "Additional vehicle information:"
    puts ""
    puts "Body: #{vehicle.body}"
    puts "Transmission: #{vehicle.transmission}"
    puts "Drive: #{vehicle.drive}"
    puts "Fuel: #{vehicle.fuel}"
    puts "Engine: #{vehicle.engine}"
  end
  
end