require 'spec_helper'

describe "expenses/edit" do
  before(:each) do
    store = FactoryGirl.create(:store)
    @expense = assign(:expense, stub_model(Expense,
      :store_id => store.id,
      :cost => "9.99",
      :comment => "MyString"
    ))

    assign(:stores, [stub_model(Store, :name => 'New One')])
    assign(:payment_types, [stub_model(PaymentType, :name => 'Money')])
  end

  it "renders the edit expense form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => expenses_path(@expense), :method => "post" do
      assert_select "select#expense_store_id", :name => "expense[store_id]"
      assert_select "input#appendedPrependedInput", :name => "expense[cost]"
      assert_select "textarea#expense_comment", :name => "expense[comment]"
    end
  end
end
