require 'spec_helper'

describe ApplicationHelper do

	describe "class_property_for_menu" do
		before(:each) do
			helper.stub!(:params).and_return({:controller => 'store'})
		end

		it "should return nil" do
			helper.class_property_for_menu('expense').should be_nil
		end

		it "should return class" do
			helper.class_property_for_menu('store').should == ' class=active'
		end
	end

	it "should return link_to_edit" do
		helper.link_to_edit(FactoryGirl.create(:store)).should == "<a href=\"/stores/1/edit\" class=\"btn btn-small\"><i class=\"icon-pencil\"></i> Edit</a>"
	end

	it "should return link_to_destroy" do
		helper.link_to_destroy(FactoryGirl.create(:store)).should == "<a href=\"/stores/1\" class=\"btn btn-small btn-danger\" data-confirm=\"Are you sure?\" data-method=\"delete\" rel=\"nofollow\"><i class=\"icon-trash\"></i> Destroy</a>"
	end

	it "should format date" do
		helper.format_date('2012-01-10'.to_date).should == '10/01/2012'
	end

	it "should return nil for format date" do
		helper.format_date(nil).should be_nil
	end
end