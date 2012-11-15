FactoryGirl.define do
  factory :motel do
    nome 'motel'
    endereco 'endereco'
    endnumero '12'
    endcomplemento 'complemento'
    cidade 'cidade'
    uf 'uf'
    telefone1 '12345678'
    telefone2 '87654321'
    latitude '12'
    longitude '21'
    ativo true
  end
end
