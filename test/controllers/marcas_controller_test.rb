require 'test_helper'

class MarcasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @marcas = marcas(:one)
  end

  test "should get index" do
    get marcas_index_url
    assert_response :success
  end

  test "should get new" do
    get new_marcas_url
    assert_response :success
  end

  test "should create marcas" do
    assert_difference('Marcas.count') do
      post marcas_index_url, params: { marcas: { nome: @marcas.nome } }
    end

    assert_redirected_to marcas_url(Marcas.last)
  end

  test "should show marcas" do
    get marcas_url(@marcas)
    assert_response :success
  end

  test "should get edit" do
    get edit_marcas_url(@marcas)
    assert_response :success
  end

  test "should update marcas" do
    patch marcas_url(@marcas), params: { marcas: { nome: @marcas.nome } }
    assert_redirected_to marcas_url(@marcas)
  end

  test "should destroy marcas" do
    assert_difference('Marcas.count', -1) do
      delete marcas_url(@marcas)
    end

    assert_redirected_to marcas_index_url
  end
end
