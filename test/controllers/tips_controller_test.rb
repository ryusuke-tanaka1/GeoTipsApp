require 'test_helper'

class TipsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tips_new_url
    assert_response :success
  end

end
