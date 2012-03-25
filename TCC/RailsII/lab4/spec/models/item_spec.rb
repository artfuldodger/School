require 'spec_helper'

describe Item do
  describe "#quantity" do
    it "defaults to 0" do
      Item.new(:quantity => nil).quantity.should be_zero
    end

    it "returns the set quantity otherwise" do
      Item.new(:quantity => 7).quantity.should == 7
    end
  end

  describe "#display_name" do
    it "returns just the item's name if quantity is zero" do
      Item.new(:name => 'Name', :quantity => 0).display_name.should == 'Name'
    end

    it "returns the item's name with the quantity in parens if the quantity is greater than zero" do
      Item.new(:name => 'Name', :quantity => 2).display_name.should == 'Name (2)'
    end
  end
end
