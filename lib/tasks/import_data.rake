require 'csv'
namespace :import do

  desc "Import station data"
  task stations: :environment do 
    station_csv = File.join Rails.root, "notes/station-data.csv"
    CSV.foreach(station_csv, headers: true) do |row|
      s = Station.new
      s.identifier = row["identifier"]
      s.name = row["name"]
      s.address = row["address"]
      s.save
    end
  end

  desc "Import bike data"
  task bikes: :environment do 
    bike_csv = File.join Rails.root, "notes/bike-data.csv"
    CSV.foreach(bike_csv, headers: true) do |row|
      b = Bike.new
      b.identifier = row["identifier"]
      b.current_station_id = row["current_station_identifier"]
      b.save
    end
  end

end 