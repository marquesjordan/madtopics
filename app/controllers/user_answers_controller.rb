class UserAnswersController < ApplicationController
  
  def new
  	@useranswer = UserAnswer.new
    @answer_id = params[:answer_id]
    @user_id = params[:user_id]
    UserAnswer.create(user_id: @user_id, answer_id: @answer_id )
    @answer = Answer.find(params[:answer_id])
    @question_id = @answer.question_id
    
    @question = Question.find(@question_id)


    @q_votes = @question.votes + 1
    @a_votes = @answer.votes + 1
    @a_ratio = @a_votes.to_f / @q_votes.to_f

    @question.update_attributes(votes: @q_votes)
    @answer.update_attributes(votes: @a_votes, vote_ratio: @a_ratio)

    redirect_to questions_path
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


