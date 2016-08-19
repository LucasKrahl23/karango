json.extract! perfisusuario, :id, :nome, :admin_flag, :created_at, :updated_at
json.url perfisusuario_url(perfisusuario, format: :json)