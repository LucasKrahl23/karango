json.extract! formaspagamento, :id, :nome, :created_at, :updated_at
json.url formaspagamento_url(formaspagamento, format: :json)