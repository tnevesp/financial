Given /^the following store exist:$/ do |table|
  table.hashes.each do |hash|
  	create_store_with_store_type(hash[:name], hash[:store_type_name])
  end
end

Given /^some stores$/ do
  [["Ri Happy", "Kids"], ["CK", "Clothes"]].each do |store_name, store_type|
  	create_store_with_store_type(store_name, store_type)
  end
end

def create_store_with_store_type(store_name, store_type)
	store_type = StoreType.find_or_create_by_name(store_type)
  store = Store.create(:name => store_name, :store_type_id => store_type.id)
end

Dado /^que tenho loja "(.*?)"$/ do |names|
	store_type = StoreType.create(:name => 'Teste')
  names.split(',').each do |name|
  	Store.create(:name => name, :store_type_id => store_type.id)	
	end
	puts "*"*80
	puts Store.first.name
end
