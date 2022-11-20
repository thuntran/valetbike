require 'csv'

namespace :import_data do

    desc "Import stations from CSV file"
    task data: :environment do

        stations_data = File.join Rails.root, "notes/valetbike-station-data.csv"
        CSV.foreach(stations_data, headers: true) do |row|
            s = Station.new
            s.name = row["name"]
            s.address = row["address"]
            s.identifier = row["identifier"]
            s.dock_count = row["dock_count"]
            s.docked_bike_count = row["docked_bike_count"]
            s.save
        end

        bikes_data = File.join Rails.root, "notes/valetbike-bike-data.csv"
        CSV.foreach(bikes_data, headers: true) do |row|
            b = Bike.new
            b.identifier = row["identifier"]
            b.current_station = Station.find_by(identifier: row["current_station_identifier"])
            #b.current_station_id = row["current_station_identifier"]
            b.battery_percentage = row["battery_percentage"]
            b.save
        end
        puts "Stations data import successful."


    end        
    # puts "This is the end of importation."
end