require "test_helper"

class AdmsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adms_index_url
    assert_response :success
  end

  test "should get show" do
    get adms_show_url
    assert_response :success
  end

  test "should get create" do
    get adms_create_url
    assert_response :success
  end

  test "should get update" do
    get adms_update_url
    assert_response :success
  end

  test "should get delete" do
    get adms_delete_url
    assert_response :success
  end
end
