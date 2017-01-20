require 'test_helper'

class OystersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get oysters_show_url
    assert_response :success
  end

end
