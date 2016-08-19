json.extract! veiculo, :id, :nome, :placa, :usuario_id, :marca_id, :tiposveiculo_id, :created_at, :updated_at
json.url veiculo_url(veiculo, format: :json)