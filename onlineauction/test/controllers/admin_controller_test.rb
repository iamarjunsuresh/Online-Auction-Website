require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_index_url
    assert_response :success
  end

  test "should get vproduct" do
    get admin_vproduct_url
    assert_response :success
  end

  test "should get vuser" do
    get admin_vuser_url
    assert_response :success
  end

end
