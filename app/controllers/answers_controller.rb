class AnswersController < ApplicationController

	def new
		# @question = Question.find(params[:question_id])
		# @answer = @question.answer.build
		@answer = Answer.new
	end
	
	def create
		@answer = Answer.new(params.require(:answer).permit(:description))
		if @answer.save
			# @answer = @question.answers.create(params.require(:answer).permit(:description))
			redirect_to questions_path
		else
			render "new"
		end
		# @question = Question.find(params[:question_id])
		# @answer = @question.answer.build(params[:answer])
		# @answer = @question.answers.create(params.require(:answer).permit(:description))
		# @answer = @question.answers.create(params[:description])
	end
end
