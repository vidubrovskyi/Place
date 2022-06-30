require "application_system_test_case"

class PtsTest < ApplicationSystemTestCase
  setup do
    @pt = pts(:one)
  end

  test "visiting the index" do
    visit pts_url
    assert_selector "h1", text: "Pts"
  end

  test "should create pt" do
    visit pts_url
    click_on "New pt"

    fill_in "Pt", with: @pt.pt
    click_on "Create Pt"

    assert_text "Pt was successfully created"
    click_on "Back"
  end

  test "should update Pt" do
    visit pt_url(@pt)
    click_on "Edit this pt", match: :first

    fill_in "Pt", with: @pt.pt
    click_on "Update Pt"

    assert_text "Pt was successfully updated"
    click_on "Back"
  end

  test "should destroy Pt" do
    visit pt_url(@pt)
    click_on "Destroy this pt", match: :first

    assert_text "Pt was successfully destroyed"
  end
end
