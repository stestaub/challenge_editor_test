require 'test_helper'

class SequenceConditionsControllerTest < ActionController::TestCase
  setup do
    @sequence_condition = sequence_conditions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sequence_conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sequence_condition" do
    assert_difference('SequenceCondition.count') do
      post :create, sequence_condition: {  }
    end

    assert_redirected_to sequence_condition_path(assigns(:sequence_condition))
  end

  test "should show sequence_condition" do
    get :show, id: @sequence_condition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sequence_condition
    assert_response :success
  end

  test "should update sequence_condition" do
    put :update, id: @sequence_condition, sequence_condition: {  }
    assert_redirected_to sequence_condition_path(assigns(:sequence_condition))
  end

  test "should destroy sequence_condition" do
    assert_difference('SequenceCondition.count', -1) do
      delete :destroy, id: @sequence_condition
    end

    assert_redirected_to sequence_conditions_path
  end
end
