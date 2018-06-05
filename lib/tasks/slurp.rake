namespace :slurp do
  desc "TODO"
  task users: :environment do
    
    require "csv"
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "user_data.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
    csv.each do |row|
      u = User.new
      u.id = row["id"]
      u.created_at = row["created_at"]
      u.updated_at = row["updated_at"]
      u.name = row["name"]
      u.email = ["email"]
      u.password = ["password"]
      u.save
      puts "#{u.name} saved"
    end
  
  puts "There are now #{User.count} rows in the user table."
  
  end

  task favorites: :environment do
    
    require "csv"
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "favorite_data.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
    Favorite.destroy_all
    csv.each do |row|
      f = Favorite.new
      f.id = row["id"]
      f.created_at = row["created_at"]
      f.updated_at = row["updated_at"]
      f.favoriter_id = row["favoriter_id"]
      f.favorited_id = ["favorited_id"]
      f.save
      puts "#{f.id} saved"
    end
  
  puts "There are now #{Favorite.count} rows in the favorite table."
  
  end

end
