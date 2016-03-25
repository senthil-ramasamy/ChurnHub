require 'test_helper'

class SolnsControllerTest < ActionController::TestCase
  setup do
    @soln = solns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:solns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create soln" do
    assert_difference('Soln.count') do
      post :create, soln: { prob_id: @soln.prob_id, solnauthor: @soln.solnauthor, solndate: @soln.solndate, solnid: @soln.solnid, solnname: @soln.solnname, solnrating: @soln.solnrating, solntext: @soln.solntext, solnvotes: @soln.solnvotes }
    end

    assert_redirected_to soln_path(assigns(:soln))
  end

  test "should show soln" do
    get :show, id: @soln
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @soln
    assert_response :success
  end

  test "should update soln" do
    patch :update, id: @soln, soln: { prob_id: @soln.prob_id, solnauthor: @soln.solnauthor, solndate: @soln.solndate, solnid: @soln.solnid, solnname: @soln.solnname, solnrating: @soln.solnrating, solntext: @soln.solntext, solnvotes: @soln.solnvotes }
    assert_redirected_to soln_path(assigns(:soln))
  end

  test "should destroy soln" do
    assert_difference('Soln.count', -1) do
      delete :destroy, id: @soln
    end

    assert_redirected_to solns_path
  end
end
