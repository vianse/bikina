require 'test_helper'

class CpsControllerTest < ActionController::TestCase
  setup do
    @cp = cps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cp" do
    assert_difference('Cp.count') do
      post :create, cp: { asentamiento: @cp.asentamiento, codigo: @cp.codigo, estado: @cp.estado, municipio: @cp.municipio, tipoAsentamiento: @cp.tipoAsentamiento }
    end

    assert_redirected_to cp_path(assigns(:cp))
  end

  test "should show cp" do
    get :show, id: @cp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cp
    assert_response :success
  end

  test "should update cp" do
    patch :update, id: @cp, cp: { asentamiento: @cp.asentamiento, codigo: @cp.codigo, estado: @cp.estado, municipio: @cp.municipio, tipoAsentamiento: @cp.tipoAsentamiento }
    assert_redirected_to cp_path(assigns(:cp))
  end

  test "should destroy cp" do
    assert_difference('Cp.count', -1) do
      delete :destroy, id: @cp
    end

    assert_redirected_to cps_path
  end
end
