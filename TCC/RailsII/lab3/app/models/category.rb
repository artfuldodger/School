class Category < ActiveRecord::Base
  has_many :questions

  validates :name, presence: true

  def num_questions
    questions.size
  end
end
