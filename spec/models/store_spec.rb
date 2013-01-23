# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Store do
  subject { Store.create }

  valid_attributes = { :name => 'Subway' , :store_type_id => 1}

  it "should validate presence of" do
  	subject.error_on(:name).should == ["não pode ficar em branco"]
  end

  it "should validate presence of store type" do
    subject.error_on(:store_type).should == ["não pode ficar em branco"]
  end

  it "should validate uniqueness of" do
    FactoryGirl.create(:store)
    Store.create(:name => 'apple').error_on(:name).should == ["já está em uso"]
  end

  it "should create successfully" do
  	Store.create(valid_attributes).should be_true
  end
end