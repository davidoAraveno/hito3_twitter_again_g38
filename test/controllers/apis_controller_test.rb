require 'test_helper'

class ApisControllerTest < ActionDispatch::IntegrationTest
  test "should get news" do
    get apis_news_url
    assert_response :success
  end

  test "should get create" do
    get apis_create_url
    assert_response :success
  end

end
