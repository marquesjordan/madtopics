class Answer
  include Mongoid::Document
  field :question_id, type: String
  field :description, type: String

  # belongs_to :question
end
