require "test_helper"

class HitsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hits_new_url
    assert_response :success
  end

  test "should get edit" do
    get hits_edit_url
    assert_response :success
  end

  test "should get index" do
    get hits_index_url
    assert_response :success
  end

  test "should get show" do
    get hits_show_url
    assert_response :success
  end
end
