require "test_helper"

class MissingItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @missing_item = missing_items(:one)
  end

  test "should get index" do
    get missing_items_url
    assert_response :success
  end

  test "should get new" do
    get new_missing_item_url
    assert_response :success
  end

  test "should create missing_item" do
    assert_difference('MissingItem.count') do
      post missing_items_url, params: { missing_item: { city: @missing_item.city, description: @missing_item.description, is_missing: @missing_item.is_missing, name: @missing_item.name, region: @missing_item.region, user_id: @missing_item.user_id } }
    end

    assert_redirected_to missing_item_url(MissingItem.last)
  end

  test "should show missing_item" do
    get missing_item_url(@missing_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_missing_item_url(@missing_item)
    assert_response :success
  end

  test "should update missing_item" do
    patch missing_item_url(@missing_item), params: { missing_item: { city: @missing_item.city, description: @missing_item.description, is_missing: @missing_item.is_missing, name: @missing_item.name, region: @missing_item.region, user_id: @missing_item.user_id } }
    assert_redirected_to missing_item_url(@missing_item)
  end

  test "should destroy missing_item" do
    assert_difference('MissingItem.count', -1) do
      delete missing_item_url(@missing_item)
    end

    assert_redirected_to missing_items_url
  end
end
