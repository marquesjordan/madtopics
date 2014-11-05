class UserAnswersController < ApplicationController
  
  def new
  	@useranswer = UserAnswer.new
  end

  def create
  	@useranswer = UserAnswer.new(params.require(:useranswer).permit(:user_id, :answer_id))
  end

  def destroy
  end

  def answer_ids
  	self.user_answers.map(&:answer_id)
  end

end


