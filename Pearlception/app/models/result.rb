class Result < ApplicationRecord
   #establish_connection(:"stats_#{Rails.env}")
   Result.establish_connection(
   :adapter  => "mysql2",
   :host     => ENV['STATS_DB_URL'],
   :username => ENV['STATS_DB_USER'],
   :password => ENV['STATS_DB_PASS'],
   :database => "main"
   )
end
