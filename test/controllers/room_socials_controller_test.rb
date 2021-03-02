require "test_helper"

class RoomSocialsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get room_socials_create_url
    assert_response :success
  end

  test "should get destroy" do
    get room_socials_destroy_url
    assert_response :success
  end
end
