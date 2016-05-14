require 'test_helper'

class MegustaControllerTest < ActionController::TestCase
  setup do
    @megustum = megusta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:megusta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create megustum" do
    assert_difference('Megustum.count') do
      post :create, megustum: { grupo_id: @megustum.grupo_id, megusta: @megustum.megusta, registro_id: @megustum.registro_id, user_id: @megustum.user_id }
    end

    assert_redirected_to megustum_path(assigns(:megustum))
  end

  test "should show megustum" do
    get :show, id: @megustum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @megustum
    assert_response :success
  end

  test "should update megustum" do
    patch :update, id: @megustum, megustum: { grupo_id: @megustum.grupo_id, megusta: @megustum.megusta, registro_id: @megustum.registro_id, user_id: @megustum.user_id }
    assert_redirected_to megustum_path(assigns(:megustum))
  end

  test "should destroy megustum" do
    assert_difference('Megustum.count', -1) do
      delete :destroy, id: @megustum
    end

    assert_redirected_to megusta_path
  end
end
