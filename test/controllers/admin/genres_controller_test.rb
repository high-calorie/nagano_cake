require "test_helper"

class Admin::GenresControllerTest < ActionDispatch::IntegrationTest

  # test "the truth" do
  #   assert true
  # end

  test "should get index" do
    get admin_genres_index_url
    assert_response :success
  end

end
