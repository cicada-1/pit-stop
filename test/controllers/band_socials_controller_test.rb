require "test_helper"

class BandSocialsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get band_socials_destroy_url
    assert_response :success
  end

  test "should get create" do
    get band_socials_create_url
    assert_response :success
  end
end
