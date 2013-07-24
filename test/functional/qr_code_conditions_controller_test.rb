require 'test_helper'

class QrCodeConditionsControllerTest < ActionController::TestCase
  setup do
    @qr_code_condition = qr_code_conditions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:qr_code_conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qr_code_condition" do
    assert_difference('QrCodeCondition.count') do
      post :create, qr_code_condition: { qr_value: @qr_code_condition.qr_value }
    end

    assert_redirected_to qr_code_condition_path(assigns(:qr_code_condition))
  end

  test "should show qr_code_condition" do
    get :show, id: @qr_code_condition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @qr_code_condition
    assert_response :success
  end

  test "should update qr_code_condition" do
    put :update, id: @qr_code_condition, qr_code_condition: { qr_value: @qr_code_condition.qr_value }
    assert_redirected_to qr_code_condition_path(assigns(:qr_code_condition))
  end

  test "should destroy qr_code_condition" do
    assert_difference('QrCodeCondition.count', -1) do
      delete :destroy, id: @qr_code_condition
    end

    assert_redirected_to qr_code_conditions_path
  end
end
