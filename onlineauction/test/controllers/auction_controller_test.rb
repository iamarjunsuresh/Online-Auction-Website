require 'test_helper'

class AuctionControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get auction_create_url
    assert_response :success
  end

end
