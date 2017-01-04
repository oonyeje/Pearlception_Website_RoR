class Run < ApplicationRecord
  has_many :oysters
  establish_connection(:"stats_#{Rails.env}")
end
