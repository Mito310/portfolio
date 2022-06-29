require "test_helper"

class ExamsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get exams_create_url
    assert_response :success
  end

  test "should get show" do
    get exams_show_url
    assert_response :success
  end
end
