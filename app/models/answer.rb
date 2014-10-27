class Answer
  include Mongoid::Document
  field :description, type: String

  belongs_to :question
  has_many :user_answers
  #embedded_in :question, :inverse_of => :answers
end
