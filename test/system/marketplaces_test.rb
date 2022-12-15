require "application_system_test_case"

class MarketplacesTest < ApplicationSystemTestCase
  setup do
    @marketplace = marketplaces(:one)
  end

  test "visiting the index" do
    visit marketplaces_url
    assert_selector "h1", text: "Marketplaces"
  end

  test "should create marketplace" do
    visit marketplaces_url
    click_on "New marketplace"

    fill_in "Item", with: @marketplace.item_id
    fill_in "Price", with: @marketplace.price
    fill_in "Stock", with: @marketplace.stock
    fill_in "User", with: @marketplace.user_id
    click_on "Create Marketplace"

    assert_text "Marketplace was successfully created"
    click_on "Back"
  end

  test "should update Marketplace" do
    visit marketplace_url(@marketplace)
    click_on "Edit this marketplace", match: :first

    fill_in "Item", with: @marketplace.item_id
    fill_in "Price", with: @marketplace.price
    fill_in "Stock", with: @marketplace.stock
    fill_in "User", with: @marketplace.user_id
    click_on "Update Marketplace"

    assert_text "Marketplace was successfully updated"
    click_on "Back"
  end

  test "should destroy Marketplace" do
    visit marketplace_url(@marketplace)
    click_on "Destroy this marketplace", match: :first

    assert_text "Marketplace was successfully destroyed"
  end
end
