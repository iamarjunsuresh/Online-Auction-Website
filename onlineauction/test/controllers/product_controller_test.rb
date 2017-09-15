require 'test_helper'

class ProductControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get product_show_url
    assert_response :success
  end

  test "should get edit" do
    get product_edit_url
    assert_response :success
  end

  test "should get delete" do
    get product_delete_url
    assert_response :success
  end

  test "should get createauction" do
    get product_createauction_url
    assert_response :success
  end

  test "should get cancelauction" do
    get product_cancelauction_url
    assert_response :success
  end

  test "should get editauction" do
    get product_editauction_url
    assert_response :success
  end

end
