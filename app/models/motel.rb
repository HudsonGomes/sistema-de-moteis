class Motel < ActiveRecord::Base

  has_many :suites

  attr_accessor :menor_valor

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
  validates :ddd1, :length => { :is => 3, :message => 'O DDD deve possuir 3 caracteres' }
  validates :ddd1, :numericality => { :message => 'O DDD deve conter somente numeros' }
  validates :ativo, :presence => true
  validates :cep, :presence => { :message => 'O cep deve ser preenchido' }

  INATIVO = 0
  ATIVO = 1

  #  acts_as_gmappable

  scope :ativos, lambda {
    where('ativo = 1')
  }

  scope :inativos, lambda {
    where('ativo = 0')
  }

  scope :por_cidade, lambda { |cidade|
    where('cidade = (?)', cidade)
  }

  scope :mais_proximos, lambda{ |latitude, longitude|
    where('ACOS( COS( RADIANS( latitude ) ) * COS( RADIANS( ? )) *
            COS(RADIANS( longitude ) - RADIANS( ? )) + SIN( RADIANS( latitude ) ) *
            SIN( RADIANS( ? ) ) ) * 6380 < 5', latitude, longitude, latitude)
  }

  scope :por_regiao, lambda { |regiao|
    where('regiao = (?)', regiao)
  }
  #  def gmaps4rails_address
  #    "#{self.latitude}, #{self.longitude}"
  #  end

  def menor_preco
    if self.suites.any?
      suites = self.suites
      suites.sort! { |obj| obj.valor}
      suites.first.valor.to_s.gsub('.',',')
    else
       " - "
    end
  end

  def self.dados_xml(motel)
    dados = []

    motel.each do |mt|
      mt.menor_valor = mt.menor_preco
      dados << {:nome => mt.nome, :cep => mt.cep, :endereco => mt.endereco,
        :endnumero => mt.endnumero, :bairro => mt.bairro, :telefone1 => mt.telefone1,
        :ddd1 => mt.ddd1, :cidade => mt.cidade, :uf => mt.uf, :latitude => mt.latitude,
        :longitude => mt.longitude, :menor_valor => mt.menor_valor}
    end

    dados
  end

end
