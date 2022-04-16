require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
  test "should get create" do
    get orders_create_url
=======
  test "should get index" do
    get orders_index_url
>>>>>>> origin/develop
    assert_response :success
  end

  test "should get show" do
    get orders_show_url
    assert_response :success
  end
<<<<<<< HEAD

  test "should get destroy" do
    get orders_destroy_url
    assert_response :success
  end
=======
>>>>>>> origin/develop
end
