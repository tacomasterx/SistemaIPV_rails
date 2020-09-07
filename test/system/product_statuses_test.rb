require "application_system_test_case"

class ProductStatusesTest < ApplicationSystemTestCase
  setup do
    @product_status = product_statuses(:one)
  end

  test "visiting the index" do
    visit product_statuses_url
    assert_selector "h1", text: "Product Statuses"
  end

  test "creating a Product status" do
    visit product_statuses_url
    click_on "New Product Status"

    fill_in "Managable", with: @product_status.managable
    fill_in "Name", with: @product_status.name
    click_on "Create Product status"

    assert_text "Product status was successfully created"
    click_on "Back"
  end

  test "updating a Product status" do
    visit product_statuses_url
    click_on "Edit", match: :first

    fill_in "Managable", with: @product_status.managable
    fill_in "Name", with: @product_status.name
    click_on "Update Product status"

    assert_text "Product status was successfully updated"
    click_on "Back"
  end

  test "destroying a Product status" do
    visit product_statuses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product status was successfully destroyed"
  end
end
