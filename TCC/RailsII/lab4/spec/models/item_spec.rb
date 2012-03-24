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
end
