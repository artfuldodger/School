class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :answers

  validates :title, :detail, :category_id, presence: true
  
  def num_answers
    answers.size
  end
end
