class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_secure_password
  field :name, type: String
  field :username, type: String
  field :email, type: String
  field :password_digest, type: String

  has_many :user_answers
  has_many :questions
  
  # def answer_ids
  # 	self.user_answers.map(&:answer_id)
  # end

  # def answer_ids=(vals)
  #   my_ua = UserAnswer.where(user_id: self.id).map(&:answer_id)
  #   vals.each do |a|
  #     next if a.blank?
  #     a_id = BSON::ObjectId.from_string(a)
  #     if my_ua.include?(a_id)
  #       my_ua.delete(a_id)
  #     else
  #       self.user_answers.create(answer_id: a_id)
  #     end
  #   end
  #   # my_ua.each do |r|
  #   #   UserAnswer.find_by(user_id: self.id, answer_id: r).destroy
  #   # end
  # end

  # def answers
  # 	Answer.find(answer_ids)
  # end

end
