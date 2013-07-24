require 'test_helper'

class QuestionConditionsControllerTest < ActionController::TestCase
  setup do
    @question_condition = question_conditions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:question_conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question_condition" do
    assert_difference('QuestionCondition.count') do
      post :create, question_condition: { correct_answers: @question_condition.correct_answers }
    end

    assert_redirected_to question_condition_path(assigns(:question_condition))
  end

  test "should show question_condition" do
    get :show, id: @question_condition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question_condition
    assert_response :success
  end

  test "should update question_condition" do
    put :update, id: @question_condition, question_condition: { correct_answers: @question_condition.correct_answers }
    assert_redirected_to question_condition_path(assigns(:question_condition))
  end

  test "should destroy question_condition" do
    assert_difference('QuestionCondition.count', -1) do
      delete :destroy, id: @question_condition
    end

    assert_redirected_to question_conditions_path
  end
end
