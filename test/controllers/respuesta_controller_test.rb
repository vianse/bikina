require 'test_helper'

class RespuestaControllerTest < ActionController::TestCase
  setup do
    @respuestum = respuesta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:respuesta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create respuestum" do
    assert_difference('Respuestum.count') do
      post :create, respuestum: { comentario_id: @respuestum.comentario_id, grupo_id: @respuestum.grupo_id, registro_id: @respuestum.registro_id, respuesta: @respuestum.respuesta, user_id: @respuestum.user_id }
    end

    assert_redirected_to respuestum_path(assigns(:respuestum))
  end

  test "should show respuestum" do
    get :show, id: @respuestum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @respuestum
    assert_response :success
  end

  test "should update respuestum" do
    patch :update, id: @respuestum, respuestum: { comentario_id: @respuestum.comentario_id, grupo_id: @respuestum.grupo_id, registro_id: @respuestum.registro_id, respuesta: @respuestum.respuesta, user_id: @respuestum.user_id }
    assert_redirected_to respuestum_path(assigns(:respuestum))
  end

  test "should destroy respuestum" do
    assert_difference('Respuestum.count', -1) do
      delete :destroy, id: @respuestum
    end

    assert_redirected_to respuesta_path
  end
end
