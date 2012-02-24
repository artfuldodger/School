require 'spec_helper'

describe Category do
  it "recognizes a category with all required attributes" do
    category = Factory(:category)
    category.valid?.should be_true
  end

  it "requires a name" do
    lambda { Factory(:category, name: nil) }.should raise_error ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank"
  end

  describe "#num_questions" do
    before do
      @category = Factory(:category)
    end

    it "returns 0 when there are no questions" do
      @category.num_questions.should == 0
    end

    it "returns the count of questions for the category" do
      2.times { Factory(:question, category_id: @category.id, user_id: Factory(:user).id) }
      @category.num_questions.should == 2
    end
  end
end
