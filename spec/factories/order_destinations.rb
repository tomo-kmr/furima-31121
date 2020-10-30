FactoryBot.define do
  factory :order_destination do
    postal_code         { '123-4567' }
    address_pref_id     { 3 }
    address_city        { 'abc市' }
    address_num         { '1-1-1' }
    address_build       { 'アパート' }
    phone_number        { '09012345678' }
    token               { 'tk_xxxxxxxxxxxxxxxx' }
  end
end
