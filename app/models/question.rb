class Question
  include Mongoid::Document
  field :topic, type: String
  field :enigma, type: String

  has_many :answers, :dependent => :destroy, :autosave => true 
  belongs_to :user
  # embeds_many :answers
  accepts_nested_attributes_for :answers
end
