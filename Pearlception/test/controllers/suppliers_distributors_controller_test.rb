require 'test_helper'

class SuppliersDistributorsControllerTest < ActionDispatch::IntegrationTest
  test "should get suppliers" do
    get suppliers_distributors_suppliers_url
    assert_response :success
  end

  test "should get distributors" do
    get suppliers_distributors_distributors_url
    assert_response :success
  end

  test "should get new" do
    get suppliers_distributors_new_url
    assert_response :success
  end

  test "should get create" do
    get suppliers_distributors_create_url
    assert_response :success
  end

end
