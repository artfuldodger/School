class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  validates :detail, :question_id, presence: true
end
