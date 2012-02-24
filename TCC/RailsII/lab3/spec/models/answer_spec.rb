require 'spec_helper'

describe Answer do
  before do
    @user = Factory(:user)
    @category = Factory(:category)
    @question = Factory(:question, category_id: @category)
  end

  it "recognizes an answer with all required attributes" do
    answer = Factory(:answer, user_id: @user.id, question_id: @question.id)
    answer.valid?.should be_true
  end

  it "requires a detail" do
    lambda { Factory(:answer, user_id: @user.id, question_id: @question.id, detail: nil) }.should raise_error ActiveRecord::RecordInvalid, "Validation failed: Detail can't be blank"
  end
end
