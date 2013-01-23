# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Expense do
	subject { Expense.create }

  valid_attributes = { :comment => '', :cost => 29.99, :store_id => 1, :payment_type_id => 1, :payment_at => Time.now }

  [:cost, :store_id, :payment_type_id, :payment_at].each do |attribute|
	  it "should validate presence of #{attribute}" do
	  	subject.error_on(attribute).should == ["não pode ficar em branco"]
	  end
	end

  it "should validate numericality of" do
    Expense.create(:cost => '29o').error_on(:cost).should == ["não é um número"]
  end

  it "should create successfully" do
  	Expense.create(valid_attributes).should be_true
  end

  it "should sum the costs" do
    store = FactoryGirl.create(:store)
    expenses = [
      FactoryGirl.create(:expense, :cost => 39.99, :store_id => store.id),
      FactoryGirl.create(:expense, :cost => 1.71, :store_id => store.id),
      FactoryGirl.create(:expense, :cost => 0.99, :store_id => store.id)
    ]
    Expense.sum(expenses).should == 42.69
  end

  it "should return 0 when it does not have costs" do
    Expense.sum([]).should == 0
  end
end