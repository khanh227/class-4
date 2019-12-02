require 'test_helper'

class Welcome2ControllerTest < ActionDispatch::IntegrationTest
  test "should get index2" do
    get welcome2_index2_url
    assert_response :success
  end

end
