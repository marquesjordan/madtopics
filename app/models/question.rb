class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  field :enigma, type: String
  field :votes, type: Integer, default: 0


  has_many :answers, :dependent => :destroy, :autosave => true 
  belongs_to :topic
  belongs_to :user
  has_many :user_answers

  validates :topic, :presence => true
  validates :enigma, presence: true
  # embeds_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true, :reject_if => proc { |att| att[:description].blank? }
  
end
