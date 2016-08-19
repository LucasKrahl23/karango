require 'test_helper'

class ManutencoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manutencao = manutencoes(:one)
  end

  test "should get index" do
    get manutencoes_url
    assert_response :success
  end

  test "should get new" do
    get new_manutencao_url
    assert_response :success
  end

  test "should create manutencao" do
    assert_difference('Manutencao.count') do
      post manutencoes_url, params: { manutencao: { descricao: @manutencao.descricao, formaspagamento_id: @manutencao.formaspagamento_id, kmvalidade: @manutencao.kmvalidade, manutencao_dt: @manutencao.manutencao_dt, obs: @manutencao.obs, odometro: @manutencao.odometro, validade_dt: @manutencao.validade_dt, valor: @manutencao.valor, veiculo_id: @manutencao.veiculo_id } }
    end

    assert_redirected_to manutencao_url(Manutencao.last)
  end

  test "should show manutencao" do
    get manutencao_url(@manutencao)
    assert_response :success
  end

  test "should get edit" do
    get edit_manutencao_url(@manutencao)
    assert_response :success
  end

  test "should update manutencao" do
    patch manutencao_url(@manutencao), params: { manutencao: { descricao: @manutencao.descricao, formaspagamento_id: @manutencao.formaspagamento_id, kmvalidade: @manutencao.kmvalidade, manutencao_dt: @manutencao.manutencao_dt, obs: @manutencao.obs, odometro: @manutencao.odometro, validade_dt: @manutencao.validade_dt, valor: @manutencao.valor, veiculo_id: @manutencao.veiculo_id } }
    assert_redirected_to manutencao_url(@manutencao)
  end

  test "should destroy manutencao" do
    assert_difference('Manutencao.count', -1) do
      delete manutencao_url(@manutencao)
    end

    assert_redirected_to manutencoes_url
  end
end
