class Abastecimento < ApplicationRecord
  belongs_to :veiculo
  belongs_to :combustivel
  belongs_to :formaspagamento
end
