json.extract! usuario, :id, :nome, :email, :senha, :cadastro_dt, :ativo_flag, :perfisusuario_id, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)