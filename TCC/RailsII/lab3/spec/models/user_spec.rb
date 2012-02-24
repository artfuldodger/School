require 'spec_helper'

describe User do
  it "recognizes a user with all required attributes" do
    user = Factory(:user)
    user.valid?.should be_true
  end

  it "requires a name" do
    lambda { Factory(:user, name: nil) }.should raise_error ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank"
  end

  it "requires an email" do
    lambda { Factory(:user, email: nil) }.should raise_error ActiveRecord::RecordInvalid, "Validation failed: Email can't be blank"
  end

  it "requires a unique email" do
    Factory(:user, email: 'test@test.com')
    lambda { Factory(:user, email: 'test@test.com') }.should raise_error ActiveRecord::RecordInvalid, "Validation failed: Email has already been taken"
  end

  describe "#questions_answered" do
    it "gets the questions the user has answered" do
      bob = Factory(:user)
      joe = Factory(:user)
      category = Factory(:category)
      # bob asks a question
      question = Factory(:question, category_id: category.id, user_id: bob.id)
      # joe answers it
      answer = Factory(:answer, question_id: question.id, user_id: joe.id)
      joe.questions_answered == [question]
    end
  end
end
