require 'spec_helper'

describe "expenses/index" do
  before(:each) do
    store ||= Store.create(:name => 'New Store')
    assign(:expenses, [
      stub_model(Expense,
        :store_id => store.id,
        :cost => "9.99",
        :comment => "Comment"
      ),
      stub_model(Expense,
        :store_id => store.id,
        :cost => "9.99",
        :comment => "Comment"
      )
    ])

    assign(:stores, [
      stub_model(Store,
        :name => 'New one'
      )
    ])
  end

  it "renders a list of expenses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "New Store", :count => 2
    assert_select "tr>td>p", :text => "- R$ 9,99".to_s, :count => 2
    assert_select "tr>td", :text => "Comment".to_s, :count => 2
  end
end
