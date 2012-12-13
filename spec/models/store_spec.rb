require 'spec_helper'

describe Store do
  subject { Store.create }

  it "should validate presence of" do
  	subject.error_on(:name) { should == ["can't be blank"] }
  end

  it "should validate uniqueness of" do
    FactoryGirl.create(:store)
    Store.create(:name => 'apple').error_on(:name) { should == ["has already been taken"] }
  end
end