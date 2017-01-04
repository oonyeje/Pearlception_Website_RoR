class Oyster < ActiveRecord::Base
    establish_connection("stats")
    
end
