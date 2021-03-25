require "application_system_test_case"

class TestApisTest < ApplicationSystemTestCase
  setup do
    @test_api = test_apis(:one)
  end

  test "visiting the index" do
    visit test_apis_url
    assert_selector "h1", text: "Test Apis"
  end

  test "creating a Test api" do
    visit test_apis_url
    click_on "New Test Api"

    fill_in "Body", with: @test_api.body
    fill_in "Fakeid", with: @test_api.fakeId
    fill_in "Title", with: @test_api.title
    fill_in "Userid", with: @test_api.userId
    click_on "Create Test api"

    assert_text "Test api was successfully created"
    click_on "Back"
  end

  test "updating a Test api" do
    visit test_apis_url
    click_on "Edit", match: :first

    fill_in "Body", with: @test_api.body
    fill_in "Fakeid", with: @test_api.fakeId
    fill_in "Title", with: @test_api.title
    fill_in "Userid", with: @test_api.userId
    click_on "Update Test api"

    assert_text "Test api was successfully updated"
    click_on "Back"
  end

  test "destroying a Test api" do
    visit test_apis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Test api was successfully destroyed"
  end
end
