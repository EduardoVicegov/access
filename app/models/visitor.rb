class Visitor < ApplicationRecord
  validates :name, :cpf, :visit_sector, :observation, presence: true
  validates :cpf, uniqueness: true

  # Defina as colunas que voce deseja habilitar para pesquisa
  def self.ransackable_attributes(auth_object = nil)
    %w[name cpf]
  end

  enum fields_visit_sector: {
    Gabinete: 'Gabinete',
    CTIGI: 'CTIGI',
    RH: 'RH',
    UGP_Prévio: 'UGP_Prévio',
    Comunicação: 'Comunicação'
  }
  #KAMINARI
  paginates_per 10

end
