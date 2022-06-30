require "test_helper"

class PtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pt = pts(:one)
  end

  test "should get index" do
    get pts_url
    assert_response :success
  end

  test "should get new" do
    get new_pt_url
    assert_response :success
  end

  test "should create pt" do
    assert_difference("Pt.count") do
      post pts_url, params: { pt: { pt: @pt.pt } }
    end

    assert_redirected_to pt_url(Pt.last)
  end

  test "should show pt" do
    get pt_url(@pt)
    assert_response :success
  end

  test "should get edit" do
    get edit_pt_url(@pt)
    assert_response :success
  end

  test "should update pt" do
    patch pt_url(@pt), params: { pt: { pt: @pt.pt } }
    assert_redirected_to pt_url(@pt)
  end

  test "should destroy pt" do
    assert_difference("Pt.count", -1) do
      delete pt_url(@pt)
    end

    assert_redirected_to pts_url
  end
end
