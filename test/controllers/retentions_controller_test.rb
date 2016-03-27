require 'test_helper'

class RetentionsControllerTest < ActionController::TestCase
  setup do
    @retention = retentions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:retentions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create retention" do
    assert_difference('Retention.count') do
      post :create, retention: { modcheck: @retention.modcheck, offer1: @retention.offer1, offer2: @retention.offer2, offer3: @retention.offer3, range: @retention.range, retid: @retention.retid, trainmodel_id: @retention.trainmodel_id }
    end

    assert_redirected_to retention_path(assigns(:retention))
  end

  test "should show retention" do
    get :show, id: @retention
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @retention
    assert_response :success
  end

  test "should update retention" do
    patch :update, id: @retention, retention: { modcheck: @retention.modcheck, offer1: @retention.offer1, offer2: @retention.offer2, offer3: @retention.offer3, range: @retention.range, retid: @retention.retid, trainmodel_id: @retention.trainmodel_id }
    assert_redirected_to retention_path(assigns(:retention))
  end

  test "should destroy retention" do
    assert_difference('Retention.count', -1) do
      delete :destroy, id: @retention
    end

    assert_redirected_to retentions_path
  end
end
