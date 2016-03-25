require 'test_helper'

class ProbsControllerTest < ActionController::TestCase
  setup do
    @prob = probs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:probs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prob" do
    assert_difference('Prob.count') do
      post :create, prob: { emp: @prob.emp, pdate: @prob.pdate, person: @prob.person, pid: @prob.pid, pname: @prob.pname, points: @prob.points, probstatus: @prob.probstatus, pstatement: @prob.pstatement, rateing: @prob.rateing, sym: @prob.sym, tag: @prob.tag, votes: @prob.votes }
    end

    assert_redirected_to prob_path(assigns(:prob))
  end

  test "should show prob" do
    get :show, id: @prob
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prob
    assert_response :success
  end

  test "should update prob" do
    patch :update, id: @prob, prob: { emp: @prob.emp, pdate: @prob.pdate, person: @prob.person, pid: @prob.pid, pname: @prob.pname, points: @prob.points, probstatus: @prob.probstatus, pstatement: @prob.pstatement, rateing: @prob.rateing, sym: @prob.sym, tag: @prob.tag, votes: @prob.votes }
    assert_redirected_to prob_path(assigns(:prob))
  end

  test "should destroy prob" do
    assert_difference('Prob.count', -1) do
      delete :destroy, id: @prob
    end

    assert_redirected_to probs_path
  end
end
