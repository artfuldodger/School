class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :answers

  def answers_count
    answers.size
  end
end
