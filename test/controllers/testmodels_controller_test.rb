require 'test_helper'

class TestmodelsControllerTest < ActionController::TestCase
  setup do
    @testmodel = testmodels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:testmodels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create testmodel" do
    assert_difference('Testmodel.count') do
      post :create, testmodel: { addtnl: @testmodel.addtnl, modcheck: @testmodel.modcheck, moddesc: @testmodel.moddesc, modid: @testmodel.modid, modname: @testmodel.modname, testfile: @testmodel.testfile, trainfile: @testmodel.trainfile, trainmodel_id: @testmodel.trainmodel_id }
    end

    assert_redirected_to testmodel_path(assigns(:testmodel))
  end

  test "should show testmodel" do
    get :show, id: @testmodel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @testmodel
    assert_response :success
  end

  test "should update testmodel" do
    patch :update, id: @testmodel, testmodel: { addtnl: @testmodel.addtnl, modcheck: @testmodel.modcheck, moddesc: @testmodel.moddesc, modid: @testmodel.modid, modname: @testmodel.modname, testfile: @testmodel.testfile, trainfile: @testmodel.trainfile, trainmodel_id: @testmodel.trainmodel_id }
    assert_redirected_to testmodel_path(assigns(:testmodel))
  end

  test "should destroy testmodel" do
    assert_difference('Testmodel.count', -1) do
      delete :destroy, id: @testmodel
    end

    assert_redirected_to testmodels_path
  end
end
