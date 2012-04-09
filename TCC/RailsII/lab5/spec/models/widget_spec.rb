require 'spec_helper'

describe Widget do
  it "requires a name" do
    widget = Widget.create(description: "hi")
    widget.errors[:name].first.should == "can't be blank"
  end

  it "requires a description" do
    widget = Widget.create(name: "hi")
    widget.errors[:description].first.should == "can't be blank"
  end

  it "validates if it has both required attributes" do
    widget = Widget.create(name: 'hi', description: "hi")
    widget.should be_valid
  end
end