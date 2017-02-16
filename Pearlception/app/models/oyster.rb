class Oyster < ApplicationRecord
    belongs_to :run 
    #Oyster.establish_connection(:"stats_#{Rails.env}") 
    #Oyster.establish_connection( 
    #:adapter  => "mysql2", 
    #:host     => ENV['STATS_DB_URL'], 
    #:username => ENV['STATS_DB_USER'], 
    #:password => ENV['STATS_DB_PASS'], 
    #:database => "main" 
    #) 
    scope :run_id, -> (id) { where run_id: id.to_i }
end
