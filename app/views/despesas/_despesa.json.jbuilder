json.extract! despesa, :id, :descricao, :despesa_dt, :valor, :formaspagamento_id, :veiculo_id, :obs, :created_at, :updated_at
json.url despesa_url(despesa, format: :json)