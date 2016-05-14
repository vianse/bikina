require 'test_helper'

class RegistrosControllerTest < ActionController::TestCase
  setup do
    @registro = registros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registro" do
    assert_difference('Registro.count') do
      post :create, registro: { categoria: @registro.categoria, correo: @registro.correo, descripcion: @registro.descripcion, direccion: @registro.direccion, logo: @registro.logo, sitioweb: @registro.sitioweb, telefono1: @registro.telefono1, telefono2: @registro.telefono2, telefono3: @registro.telefono3, titulo: @registro.titulo, user_id: @registro.user_id }
    end

    assert_redirected_to registro_path(assigns(:registro))
  end

  test "should show registro" do
    get :show, id: @registro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registro
    assert_response :success
  end

  test "should update registro" do
    patch :update, id: @registro, registro: { categoria: @registro.categoria, correo: @registro.correo, descripcion: @registro.descripcion, direccion: @registro.direccion, logo: @registro.logo, sitioweb: @registro.sitioweb, telefono1: @registro.telefono1, telefono2: @registro.telefono2, telefono3: @registro.telefono3, titulo: @registro.titulo, user_id: @registro.user_id }
    assert_redirected_to registro_path(assigns(:registro))
  end

  test "should destroy registro" do
    assert_difference('Registro.count', -1) do
      delete :destroy, id: @registro
    end

    assert_redirected_to registros_path
  end
end
