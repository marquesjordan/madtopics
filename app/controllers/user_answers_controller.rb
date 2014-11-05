class UserAnswersController < ApplicationController
  
  def new
  	@useranswer = UserAnswer.new
    @answer_id = params[:answer_id]
    @user_id = params[:user_id]
    UserAnswer.create(:user_id => @user_id, :answer_id => @answer_id )

  end

  def create
  	@useranswer = UserAnswer.new(params.require(:useranswer).permit(:user_id, :answer_id))
    @answer_id = params[:answer_id]
    @user_id = params[:user_id]
  end

  def destroy
  end

  def answer_ids
  	self.user_answers.map(&:answer_id)
  end

end


