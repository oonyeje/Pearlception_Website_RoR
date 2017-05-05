class Grade < ApplicationRecord
    self.primary_key = 'Short_name'

	def initialize(params)
		super
		self.Volume_max = (self.Height_max.to_f + self.Width_max.to_f + self.Length_max.to_f).to_s
		self.Volume_min = (self.Height_min.to_f + self.Width_min.to_f + self.Length_min.to_f).to_s
	end

end
