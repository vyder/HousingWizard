require 'test_helper'

class WizardControllerTest < ActionController::TestCase
  test "should get calculate" do
    get :calculate
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
