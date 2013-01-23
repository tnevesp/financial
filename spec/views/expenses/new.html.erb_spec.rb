require 'spec_helper'

describe "expenses/new" do
  before(:each) do
    assign(:expense, stub_model(Expense,
      :store_id => 1,
      :cost => "9.99",
      :comment => "MyString"
    ).as_new_record)

    assign(:stores, [
      stub_model(Store, :name => 'New One')
    ])

    assign(:payment_types, [stub_model(PaymentType, :name => 'Money')])
  end

  it "renders new expense form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => expenses_path, :method => "post" do
      assert_select "select#expense_store_id", :name => "expense[store_id]"
      assert_select "input#appendedPrependedInput", :name => "expense[cost]"
      assert_select "textarea#expense_comment", :name => "expense[comment]"
    end
  end
end
