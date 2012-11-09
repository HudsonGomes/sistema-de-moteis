class Motel < ActiveRecord::Base

  has_many :suites

  validates :nome, :presence => { :message => 'O nome deve ser preenchido' }
  validates :endereco, :presence => { :message => 'O endereco deve ser preenchido' }
  validates :latitude, :presence => { :message => 'A latitude deve ser preenchida' }
  validates :longitude, :presence => { :message => 'A longitude deve ser preenchida' }
  validates :telefone1, :numericality => { :message => 'O telefone 1 deve conter somente numeros' }
  validates :telefone2, :numericality => { :message => 'O telefone 2 deve conter somente numeros' }


end
