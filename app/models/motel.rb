class Motel < ActiveRecord::Base

  has_many :suites

  validates :nome, :presence => { :message => 'O nome deve ser preenchido' }
  validates :endereco, :presence => { :message => 'O endereco deve ser preenchido' }
  validates :latitude, :presence => { :message => 'A latitude deve ser preenchida' }
  validates :latitude, :numericality => { :message => 'A latitude deve conter somente numeros' }
  validates :longitude, :presence => { :message => 'A longitude deve ser preenchida' }
  validates :longitude, :numericality => { :message => 'A longitude deve conter somente numeros' }
  validates :telefone1, :numericality => { :message => 'O telefone deve conter somente numeros' }
  validates :telefone1, :presence => { :message => 'O telefone deve ser preenchido' }
  validates :ativo, :presence => true
  validates :cep, :presence => { :message => 'O cep deve ser preenchido' }

  scope :ativos, lambda {
    where('ativo = 1')
  }

  scope :inativos, lambda {
    where('ativo = 0')
  }

end
