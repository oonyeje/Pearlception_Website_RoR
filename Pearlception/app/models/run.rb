class Run < ApplicationRecord
    has_many :oysters 
    scope :by_date, lambda { |runDate| where(:runDate => runDate)}
    scope :by_supplier, lambda { |supplier| where(:supplier => supplier)}
    scope :by_distributor, lambda { |distributor| where(:distributor => distributor)}
end
