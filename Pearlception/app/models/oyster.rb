class Oyster < ApplicationRecord
    belongs_to :run 
    scope :run_id, -> (id) { where run_id: id.to_i }
end
