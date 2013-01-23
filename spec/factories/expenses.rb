FactoryGirl.define do
  factory :expense do
  	store_id 1
  	payment_type_id 1
  	cost 10.99
  	payment_at Time.now
  end
end