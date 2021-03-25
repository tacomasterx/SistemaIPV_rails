require "application_system_test_case"

class ProductSubtypesTest < ApplicationSystemTestCase
  setup do
    @product_subtype = product_subtypes(:one)
  end

  test "visiting the index" do
    visit product_subtypes_url
    assert_selector "h1", text: "Product Subtypes"
  end

  test "creating a Product subtype" do
    visit product_subtypes_url
    click_on "New Product Subtype"

    fill_in "Name", with: @product_subtype.name
    fill_in "Product type", with: @product_subtype.product_type_id
    click_on "Create Product subtype"

    assert_text "Product subtype was successfully created"
    click_on "Back"
  end

  test "updating a Product subtype" do
    visit product_subtypes_url
    click_on "Edit", match: :first

    fill_in "Name", with: @product_subtype.name
    fill_in "Product type", with: @product_subtype.product_type_id
    click_on "Update Product subtype"

    assert_text "Product subtype was successfully updated"
    click_on "Back"
  end

  test "destroying a Product subtype" do
    visit product_subtypes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product subtype was successfully destroyed"
  end
end
