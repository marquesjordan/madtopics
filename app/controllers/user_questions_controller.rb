class UserQuestionsController < ApplicationController
  def new
  	@userquestion = UserQuestion.new
  end

  def create
  	@userquestion = UserQuestion.new(params.require(:userquestion).permit(:user_id, :question_id))
  end

  def destroy
  end
end
