require 'test_helper'

class WentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get wents_create_url
    assert_response :success
  end

  test "should get destroy" do
    get wents_destroy_url
    assert_response :success
  end

end
