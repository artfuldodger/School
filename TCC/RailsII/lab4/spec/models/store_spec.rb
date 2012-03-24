require 'spec_helper'

describe Store do
  describe "#keyboard_shortcut" do
    it "returns the first letter of the store's name" do
      Store.new(:name => 'Liquor Store').keyboard_shortcut.should == 'L'
    end
  end
end
