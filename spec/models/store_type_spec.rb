# -*- encoding : utf-8 -*-
require 'spec_helper'

describe StoreType do
  subject { StoreType.create }

  valid_attributes = { :name => 'Clothes' }

  it "should validate presence of" do
  	subject.error_on(:name).should == ["não pode ficar em branco"]
  end

  it "should validate uniqueness of" do
    FactoryGirl.create(:store_type)
    StoreType.create(:name => 'Food').error_on(:name).should == ["já está em uso"]
  end

  it "should create successfully" do
  	StoreType.create(valid_attributes).should be_true
  end
end
