class QuestionsController < ApplicationController

	# before_action :confirm_logged_in
	

	def index
		@questions = Question.all
		@topics = Topic.all

	end

	def show
		@question = Question.find(params[:id])
		@user = current_user
	end

	def new
		@question = Question.new
		2.times { @question.answers.build }
		@topic = Topic.new
	end

	def create
		# raise params.inspect
		@question = Question.new(params.require(:question).permit(:enigma, :topic_id, :answers_attributes => [:description]))
		if @question.topic_id == nil
  			flash[:notice] = "You must select a topic catagory"
			render 'new'
		elsif @question.enigma == ""
			flash[:notice] = "You must enter a question"
			render 'new'
		elsif @question.save
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
		if @question.update_attributes(params.require(:question).permit(:enigma))
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
