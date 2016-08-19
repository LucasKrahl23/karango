require 'test_helper'

class PerfisusuariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @perfisusuario = perfisusuarios(:one)
  end

  test "should get index" do
    get perfisusuarios_url
    assert_response :success
  end

  test "should get new" do
    get new_perfisusuario_url
    assert_response :success
  end

  test "should create perfisusuario" do
    assert_difference('Perfisusuario.count') do
      post perfisusuarios_url, params: { perfisusuario: { admin_flag: @perfisusuario.admin_flag, nome: @perfisusuario.nome } }
    end

    assert_redirected_to perfisusuario_url(Perfisusuario.last)
  end

  test "should show perfisusuario" do
    get perfisusuario_url(@perfisusuario)
    assert_response :success
  end

  test "should get edit" do
    get edit_perfisusuario_url(@perfisusuario)
    assert_response :success
  end

  test "should update perfisusuario" do
    patch perfisusuario_url(@perfisusuario), params: { perfisusuario: { admin_flag: @perfisusuario.admin_flag, nome: @perfisusuario.nome } }
    assert_redirected_to perfisusuario_url(@perfisusuario)
  end

  test "should destroy perfisusuario" do
    assert_difference('Perfisusuario.count', -1) do
      delete perfisusuario_url(@perfisusuario)
    end

    assert_redirected_to perfisusuarios_url
  end
end
