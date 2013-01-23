Given /^the following store types exist:$/ do |table|
  table.hashes.each do |hash|
    StoreType.create(:name => hash[:name])
  end
end
