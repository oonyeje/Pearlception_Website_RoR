class Result < ApplicationRecord
   establish_connection(:"stats_#{Rails.env}")
end
