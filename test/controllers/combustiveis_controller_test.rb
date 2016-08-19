require 'test_helper'

class CombustiveisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @combustivel = combustiveis(:one)
  end

  test "should get index" do
    get combustiveis_url
    assert_response :success
  end

  test "should get new" do
    get new_combustivel_url
    assert_response :success
  end

  test "should create combustivel" do
    assert_difference('Combustivel.count') do
      post combustiveis_url, params: { combustivel: { nome: @combustivel.nome } }
    end

    assert_redirected_to combustivel_url(Combustivel.last)
  end

  test "should show combustivel" do
    get combustivel_url(@combustivel)
    assert_response :success
  end

  test "should get edit" do
    get edit_combustivel_url(@combustivel)
    assert_response :success
  end

  test "should update combustivel" do
    patch combustivel_url(@combustivel), params: { combustivel: { nome: @combustivel.nome } }
    assert_redirected_to combustivel_url(@combustivel)
  end

  test "should destroy combustivel" do
    assert_difference('Combustivel.count', -1) do
      delete combustivel_url(@combustivel)
    end

    assert_redirected_to combustiveis_url
  end
end
