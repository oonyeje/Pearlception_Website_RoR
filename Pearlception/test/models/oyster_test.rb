require 'test_helper'

class OysterTest < ActiveSupport::TestCase
    test "the_truth" do 
	f = Oyster.first
	puts f.inspect
        assert true
    end
end
