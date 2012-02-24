require 'spec_helper'

describe Question do
  it "recognizes a question with all required attributes" do
    question = Factory(:question)
    question.valid?.should be_true
  end

  it "requires a title" do
    lambda { Factory(:question, title: nil) }.should raise_error ActiveRecord::RecordInvalid, "Validation failed: Title can't be blank"
  end

  it "requires some detail" do
    lambda { Factory(:question, detail: nil) }.should raise_error ActiveRecord::RecordInvalid, "Validation failed: Detail can't be blank"
  end

  describe "#num_answers" do
    before do
      @question = Factory(:question)
    end

    it "returns 0 when there are no answers" do
      @question.num_answers.should == 0
    end

    it "returns the count of answers for the question" do
      2.times { Factory(:answer, question_id: @question.category.id, user_id: Factory(:user).id) }
      @question.num_answers.should == 2
    end
  end
end
