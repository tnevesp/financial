# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['Debit card', 'Credit card', 'Money'].each do |name|
	PaymentType.find_or_create_by_name(name)
end

['Lunch', 'Snack', 'Clothes', 'Gasoline', 'Night Life', 'Transport'].each do |name|
	StoreType.find_or_create_by_name(name)
end