require 'test_helper'

class CombinedConditionsControllerTest < ActionController::TestCase
  setup do
    @combined_condition = combined_conditions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:combined_conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create combined_condition" do
    assert_difference('CombinedCondition.count') do
      post :create, combined_condition: {  }
    end

    assert_redirected_to combined_condition_path(assigns(:combined_condition))
  end

  test "should show combined_condition" do
    get :show, id: @combined_condition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @combined_condition
    assert_response :success
  end

  test "should update combined_condition" do
    put :update, id: @combined_condition, combined_condition: {  }
    assert_redirected_to combined_condition_path(assigns(:combined_condition))
  end

  test "should destroy combined_condition" do
    assert_difference('CombinedCondition.count', -1) do
      delete :destroy, id: @combined_condition
    end

    assert_redirected_to combined_conditions_path
  end
end
