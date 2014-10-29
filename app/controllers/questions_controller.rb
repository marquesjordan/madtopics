class QuestionsController < ApplicationController

	def index
		@questions = Question.all
	end

	def show
		@question = Question.find(params[:id])
	end

	def new
		@question = Question.new
		2.times { @question.answers.build }
	end

	def create
		@question = Question.new(params.require(:question).permit(:topic,:enigma,:answers_attributes => [:description]))
		if @question.save
			# @answer = @question.answers.create(params.require(:answer).permit(:description))
			redirect_to questions_path
		else
			render "new"
		end
	end


	def edit
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])
		if @question.update_attributes(params.require(:question).permit(:topic,:enigma))
			redirect_to questions_path
		else
			render "edit"
		end
		
	end

	def destroy
		@question = Question.find(params[:id])
		@question.destroy
		redirect_to questions_path
	end

end
