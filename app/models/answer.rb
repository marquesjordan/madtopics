class Answer
  include Mongoid::Document
  field :description, type: String
  field :votes, type: Integer, default: 0
  field :vote_ratio, type: Float, default: 0.0

  belongs_to :question
  has_many :user_answers
  accepts_nested_attributes_for :user_answers
  validates :description, length: {
    minimum: 2,
    maximum: 50,
    too_short: "Is not a valid size" 
  }
  #embedded_in :question, :inverse_of => :answers
end
