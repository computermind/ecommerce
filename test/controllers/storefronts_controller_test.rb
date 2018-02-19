require 'test_helper'

class StorefrontsControllerTest < ActionDispatch::IntegrationTest
  test "should get all_items" do
    get storefronts_all_items_url
    assert_response :success
  end

  test "should get items_by_category" do
    get storefronts_items_by_category_url
    assert_response :success
  end

  test "should get items_by_brand" do
    get storefronts_items_by_brand_url
    assert_response :success
  end

end
