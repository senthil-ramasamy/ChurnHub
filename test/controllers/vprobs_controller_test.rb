require 'test_helper'

class VprobsControllerTest < ActionController::TestCase
  setup do
    @vprob = vprobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vprobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vprob" do
    assert_difference('Vprob.count') do
      post :create, vprob: { prob_id: @vprob.prob_id, pvauthor: @vprob.pvauthor, pvdate: @vprob.pvdate, pversion: @vprob.pversion, pvid: @vprob.pvid, pvinteger: @vprob.pvinteger, pvname: @vprob.pvname }
    end

    assert_redirected_to vprob_path(assigns(:vprob))
  end

  test "should show vprob" do
    get :show, id: @vprob
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vprob
    assert_response :success
  end

  test "should update vprob" do
    patch :update, id: @vprob, vprob: { prob_id: @vprob.prob_id, pvauthor: @vprob.pvauthor, pvdate: @vprob.pvdate, pversion: @vprob.pversion, pvid: @vprob.pvid, pvinteger: @vprob.pvinteger, pvname: @vprob.pvname }
    assert_redirected_to vprob_path(assigns(:vprob))
  end

  test "should destroy vprob" do
    assert_difference('Vprob.count', -1) do
      delete :destroy, id: @vprob
    end

    assert_redirected_to vprobs_path
  end
end
