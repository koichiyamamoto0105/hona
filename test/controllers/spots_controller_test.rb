require 'test_helper'

class SpotsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get spots_top_url
    assert_response :success
  end

  test "should get create" do
    get spots_create_url
    assert_response :success
  end

  test "should get show" do
    get spots_show_url
    assert_response :success
  end

end
