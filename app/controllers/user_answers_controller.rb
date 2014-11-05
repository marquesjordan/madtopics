class UserAnswersController < ApplicationController
  
  def new
  	@useranswer = UserAnswer.new
  end

  def create
  	@useranswer = UserAnswer.new(params.require(:useranswer).permit(:user_id, :answer_id))
  end

  def destroy
  end
end


