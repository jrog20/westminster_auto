module WestminsterAuto
  class CLI

    def call
      WestminsterAuto::Scraper.get_vehicles
      puts ""
      puts "Welcome to the Westminster Auto available vehicle list:"
      start
    end

    def start
      print_vehicles
      
      puts ""
      puts "What number vehicle would you like to see more information on? If you are done viewing our inventory, please type 'quit'."
      input = gets.strip.to_i
      
      if input == 0
        quit
      elsif input > 0 && input <= WestminsterAuto::Vehicle.all.count
        vehicle = WestminsterAuto::Vehicle.find(input)
        print_vehicle_details(vehicle) 
      else
        puts ""
        puts "Please enter a valid number."
        start
      end

      puts ""
      puts "Would you like to see another vehicle? Enter Y or N"
      input = gets.strip.downcase

      if input == "y"
        start
      elsif input == "n"
        quit
      else
        puts ""
        puts "Let me show you our current inventory."
        start
      end
    end

    def print_vehicles
      WestminsterAuto::Vehicle.all.each_with_index do |vehicle, index|
      puts ""
      puts "#{index + 1}."
      puts "#{vehicle.year} #{vehicle.make} #{vehicle.model}"
      puts "Mileage: #{vehicle.mileage}"
      puts "Price: #{vehicle.price}"
      end
    end

    def print_vehicle_details(vehicle)
      puts ""
      puts "-----------Selected Vehicle-----------"
      puts ""
      puts "#{vehicle.year} #{vehicle.make} #{vehicle.model}"
      puts "Mileage: #{vehicle.mileage}"
      puts "Price: #{vehicle.price}"
      puts ""
      puts "---Additional vehicle information:---"
      puts ""
      puts "Body: #{vehicle.body}"
      puts "Transmission: #{vehicle.transmission}"
      puts "Drive: #{vehicle.drive}"
      puts "Fuel: #{vehicle.fuel}"
      puts "Engine: #{vehicle.engine}"
    end

    def quit
      puts ""
      puts "Thank you for viewing our inventory. Have a great day!"
      puts ""
      exit
    end

  end
end