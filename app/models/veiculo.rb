class Veiculo < ApplicationRecord
  belongs_to :usuario
  belongs_to :marca
  belongs_to :tiposveiculo
end
