require 'test_helper'

class MoteisControllerTest < ActionController::TestCase
  setup do
    @motel = moteis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moteis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create motel" do
    assert_difference('Motel.count') do
      post :create, motel: @motel.attributes
    end

    assert_redirected_to motel_path(assigns(:motel))
  end

  test "should show motel" do
    get :show, id: @motel.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @motel.to_param
    assert_response :success
  end

  test "should update motel" do
    put :update, id: @motel.to_param, motel: @motel.attributes
    assert_redirected_to motel_path(assigns(:motel))
  end

  test "should destroy motel" do
    assert_difference('Motel.count', -1) do
      delete :destroy, id: @motel.to_param
    end

    assert_redirected_to moteis_path
  end
end
