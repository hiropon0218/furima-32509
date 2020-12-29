FactoryBot.define do
  factory :user_shipping do
    postal_code     { '111-1111' }
    prefecture_id   { 2 }
    municipality    {'横浜市'}
    address         { '青山1-1-1' }
    phone_number    { '09012345678' }
    token           { 'tok_abcdefghijk00000000000000000000' }
    building_name   { 'divビル' }
    user_id         { 1 }
    item_id         { 1 }
  end
end
