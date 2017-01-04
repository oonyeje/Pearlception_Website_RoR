require 'test_helper'

class OysterTest < ActiveSupport::TestCase

    test "check_connection" do 
        Oyster.connection
        assert true
    end

    test "get_first_oyster" do
        first = Oyster.first
        id = first.oyster_id == 1
        run = first.run_id == 257
        grade = first.grade == "Rej"
        assert id && run && grade
    end
	
end
