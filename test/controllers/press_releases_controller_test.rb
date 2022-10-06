require 'test_helper'

class PressReleasesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get press_releases_index_url
    assert_response :success
  end

end
