require 'test_helper'

class TiposveiculosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tiposveiculo = tiposveiculos(:one)
  end

  test "should get index" do
    get tiposveiculos_url
    assert_response :success
  end

  test "should get new" do
    get new_tiposveiculo_url
    assert_response :success
  end

  test "should create tiposveiculo" do
    assert_difference('Tiposveiculo.count') do
      post tiposveiculos_url, params: { tiposveiculo: { nome: @tiposveiculo.nome } }
    end

    assert_redirected_to tiposveiculo_url(Tiposveiculo.last)
  end

  test "should show tiposveiculo" do
    get tiposveiculo_url(@tiposveiculo)
    assert_response :success
  end

  test "should get edit" do
    get edit_tiposveiculo_url(@tiposveiculo)
    assert_response :success
  end

  test "should update tiposveiculo" do
    patch tiposveiculo_url(@tiposveiculo), params: { tiposveiculo: { nome: @tiposveiculo.nome } }
    assert_redirected_to tiposveiculo_url(@tiposveiculo)
  end

  test "should destroy tiposveiculo" do
    assert_difference('Tiposveiculo.count', -1) do
      delete tiposveiculo_url(@tiposveiculo)
    end

    assert_redirected_to tiposveiculos_url
  end
end
