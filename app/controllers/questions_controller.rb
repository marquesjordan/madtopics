class QuestionsController < ApplicationController

	def index
		@questions = Question.all
	end

	def new
		@question = Question.new
	end

	def create
		@question = Question.new(params.require(:question).permit(:topic,:enigma))
		if @question.save
			redirect_to questions_path
		else
			render "new"
		end
	end

	def show
		@question = Question.find(params[:id])
	end

end
