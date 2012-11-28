class Motel < ActiveRecord::Base

  has_many :suites

  has_attached_file :foto, :styles => { :medium => "300x300>", :thumb => "50x50>" }

  validates :nome, :presence => { :message => 'O nome deve ser preenchido' }
  validates :endereco, :presence => { :message => 'O endereco deve ser preenchido' }
  validates :bairro, :presence => { :message => 'O bairro deve ser preenchido' }
  validates :latitude, :presence => { :message => 'A latitude deve ser preenchida' }
  validates :latitude, :numericality => { :message => 'A latitude deve conter somente numeros' }
  validates :longitude, :presence => { :message => 'A longitude deve ser preenchida' }
  validates :longitude, :numericality => { :message => 'A longitude deve conter somente numeros' }
  validates :telefone1, :numericality => { :message => 'O telefone deve conter somente numeros' }
  validates :telefone1, :presence => { :message => 'O telefone deve ser preenchido' }
  validates :ddd1, :presence => { :message => 'O DDD deve ser preenchido' }
  validates :ddd1, :numericality => { :message => 'O DDD deve conter somente numeros' }
  validates :ativo, :presence => true
  validates :cep, :presence => { :message => 'O cep deve ser preenchido' }

  INATIVO = 0
  ATIVO = 1

  scope :ativos, lambda {
    where('ativo = 1')
  }

  scope :inativos, lambda {
    where('ativo = 0')
  }

  scope :por_cidade, lambda { |cidade|
    where('cidade = (?)', cidade)
  }

  scope :mais_proximos, lambda{ |lat_mais, lat_menos, long_mais, long_menos|
    where('latitude < (?) and latitude > (?) and longitude < (?) and longitude > (?)',
      (lat_mais),(lat_menos), (long_mais), (long_menos))
  }

end
