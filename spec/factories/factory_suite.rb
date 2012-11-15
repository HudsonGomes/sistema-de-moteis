FactoryGirl.define do
  factory :suite do
    nome 'suite'
    valor '12.1'

    association :motel
  end
end
