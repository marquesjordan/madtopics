class Question
  include Mongoid::Document
  field :topic, type: String
  field :enigma, type: String

  # has_many :answers, dependent :delete
end
