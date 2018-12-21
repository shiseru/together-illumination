require 'test_helper'

class IlluminationsControllerTest < ActionDispatch::IntegrationTest
  test "should get update_db" do
    get illuminations_update_db_url
    assert_response :success
  end

end
