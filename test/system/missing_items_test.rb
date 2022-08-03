require "application_system_test_case"

class MissingItemsTest < ApplicationSystemTestCase
  setup do
    @missing_item = missing_items(:one)
  end

  test "visiting the index" do
    visit missing_items_url
    assert_selector "h1", text: "Missing Items"
  end

  test "creating a Missing item" do
    visit missing_items_url
    click_on "New Missing Item"

    fill_in "City", with: @missing_item.city
    fill_in "Description", with: @missing_item.description
    check "Is missing" if @missing_item.is_missing
    fill_in "Name", with: @missing_item.name
    fill_in "Region", with: @missing_item.region
    fill_in "User", with: @missing_item.user_id
    click_on "Create Missing item"

    assert_text "Missing item was successfully created"
    click_on "Back"
  end

  test "updating a Missing item" do
    visit missing_items_url
    click_on "Edit", match: :first

    fill_in "City", with: @missing_item.city
    fill_in "Description", with: @missing_item.description
    check "Is missing" if @missing_item.is_missing
    fill_in "Name", with: @missing_item.name
    fill_in "Region", with: @missing_item.region
    fill_in "User", with: @missing_item.user_id
    click_on "Update Missing item"

    assert_text "Missing item was successfully updated"
    click_on "Back"
  end

  test "destroying a Missing item" do
    visit missing_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Missing item was successfully destroyed"
  end
end
