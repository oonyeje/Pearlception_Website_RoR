class Oyster < ApplicationRecord
    belongs_to :run
    Oyster.establish_connection(:"stats_#{Rails.env}")

        
end
