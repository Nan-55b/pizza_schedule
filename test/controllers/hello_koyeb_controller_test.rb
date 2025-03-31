require "test_helper"

class HelloKoyebControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hello_koyeb_index_url
    assert_response :success
  end
end
