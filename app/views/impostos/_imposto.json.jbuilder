json.extract! imposto, :id, :descricao, :valor, :vencimento_dt, :obs, :pago_flag, :formaspagamento_id, :veiculo_id, :created_at, :updated_at
json.url imposto_url(imposto, format: :json)