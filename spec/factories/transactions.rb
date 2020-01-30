FactoryBot.define do
  factory :transaction do
    invoice { nil }
    credit_card_number { Faker::Stripe.valid_card }
    result { 'success' }
    created_at { DateTime.now.strftime('%F %T UTC') }
    updated_at { DateTime.now.strftime('%F %T UTC') }
  end
end
