require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get imprint" do
    get :imprint
    assert_response :success
  end

end
