require "test_helper"

class LunchesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get lunches_new_url
    assert_response :success
  end

  test "should get create" do
    get lunches_create_url
    assert_response :success
  end
end
