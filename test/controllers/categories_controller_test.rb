require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get check_admin" do
    get categories_check_admin_url
    assert_response :success
  end

end
