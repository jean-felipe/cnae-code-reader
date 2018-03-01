FactoryBot.define do
  factory :trade do
    trade_type { Trade::TRADE_TYPES.sample }
    date Date.today -2.days
    price 2500.0
    cpf { Faker::CPF.numeric }
    card_number { '1234****2231' }
    hour Time.now
  end

  trait :debito do
    trade_type 'debito'
  end

  trait :credito do
    trade_type 'credito'
  end
end