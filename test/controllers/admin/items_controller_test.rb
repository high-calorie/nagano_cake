require "test_helper"

class Admin::ItemsControllerTest < ActionDispatch::IntegrationTest

  # test "the truth" do
  #   assert true
  # end

  test "should get index" do
    get admin_items_index_url
    assert_response :success
  end

end
