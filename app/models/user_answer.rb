class UserAnswer
  include Mongoid::Document
  belongs_to :user
  belongs_to :answer
end
