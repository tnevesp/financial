require 'spec_helper'

describe "expenses/edit" do
  before(:each) do
    @expense = assign(:expense, stub_model(Expense,
      :store_id => 1,
      :cost => "9.99",
      :comment => "MyString"
    ))
  end

  it "renders the edit expense form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => expenses_path(@expense), :method => "post" do
      assert_select "input#expense_store_id", :name => "expense[store_id]"
      assert_select "input#expense_cost", :name => "expense[cost]"
      assert_select "input#expense_comment", :name => "expense[comment]"
    end
  end
end
