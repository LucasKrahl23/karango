class Despesa < ApplicationRecord
  belongs_to :formaspagamento
  belongs_to :veiculo
end
