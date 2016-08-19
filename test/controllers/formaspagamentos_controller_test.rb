require 'test_helper'

class FormaspagamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @formaspagamento = formaspagamentos(:one)
  end

  test "should get index" do
    get formaspagamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_formaspagamento_url
    assert_response :success
  end

  test "should create formaspagamento" do
    assert_difference('Formaspagamento.count') do
      post formaspagamentos_url, params: { formaspagamento: { nome: @formaspagamento.nome } }
    end

    assert_redirected_to formaspagamento_url(Formaspagamento.last)
  end

  test "should show formaspagamento" do
    get formaspagamento_url(@formaspagamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_formaspagamento_url(@formaspagamento)
    assert_response :success
  end

  test "should update formaspagamento" do
    patch formaspagamento_url(@formaspagamento), params: { formaspagamento: { nome: @formaspagamento.nome } }
    assert_redirected_to formaspagamento_url(@formaspagamento)
  end

  test "should destroy formaspagamento" do
    assert_difference('Formaspagamento.count', -1) do
      delete formaspagamento_url(@formaspagamento)
    end

    assert_redirected_to formaspagamentos_url
  end
end
