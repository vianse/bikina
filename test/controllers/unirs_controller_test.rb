require 'test_helper'

class UnirsControllerTest < ActionController::TestCase
  setup do
    @unir = unirs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unirs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unir" do
    assert_difference('Unir.count') do
      post :create, unir: { grupo_id: @unir.grupo_id, user_id: @unir.user_id }
    end

    assert_redirected_to unir_path(assigns(:unir))
  end

  test "should show unir" do
    get :show, id: @unir
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unir
    assert_response :success
  end

  test "should update unir" do
    patch :update, id: @unir, unir: { grupo_id: @unir.grupo_id, user_id: @unir.user_id }
    assert_redirected_to unir_path(assigns(:unir))
  end

  test "should destroy unir" do
    assert_difference('Unir.count', -1) do
      delete :destroy, id: @unir
    end

    assert_redirected_to unirs_path
  end
end
