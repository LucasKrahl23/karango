require 'test_helper'

class AbastecimentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @abastecimento = abastecimentos(:one)
  end

  test "should get index" do
    get abastecimentos_url
    assert_response :success
  end

  test "should get new" do
    get new_abastecimento_url
    assert_response :success
  end

  test "should create abastecimento" do
    assert_difference('Abastecimento.count') do
      post abastecimentos_url, params: { abastecimento: { abastecimento_dt: @abastecimento.abastecimento_dt, combustivel_id: @abastecimento.combustivel_id, completou_flag: @abastecimento.completou_flag, formaspagamento_id: @abastecimento.formaspagamento_id, obs: @abastecimento.obs, odometro: @abastecimento.odometro, precolitro: @abastecimento.precolitro, precototal: @abastecimento.precototal, veiculo_id: @abastecimento.veiculo_id } }
    end

    assert_redirected_to abastecimento_url(Abastecimento.last)
  end

  test "should show abastecimento" do
    get abastecimento_url(@abastecimento)
    assert_response :success
  end

  test "should get edit" do
    get edit_abastecimento_url(@abastecimento)
    assert_response :success
  end

  test "should update abastecimento" do
    patch abastecimento_url(@abastecimento), params: { abastecimento: { abastecimento_dt: @abastecimento.abastecimento_dt, combustivel_id: @abastecimento.combustivel_id, completou_flag: @abastecimento.completou_flag, formaspagamento_id: @abastecimento.formaspagamento_id, obs: @abastecimento.obs, odometro: @abastecimento.odometro, precolitro: @abastecimento.precolitro, precototal: @abastecimento.precototal, veiculo_id: @abastecimento.veiculo_id } }
    assert_redirected_to abastecimento_url(@abastecimento)
  end

  test "should destroy abastecimento" do
    assert_difference('Abastecimento.count', -1) do
      delete abastecimento_url(@abastecimento)
    end

    assert_redirected_to abastecimentos_url
  end
end
