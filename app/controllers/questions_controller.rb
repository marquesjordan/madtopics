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

	def add_answer
    	@question.answers.build
  	end

	def new
		@question = Question.new
		2.times { @question.answers.build }
		@topic = Topic.new
	end

	def create
		# raise params.inspect
		@user = current_user
		
		@question = Question.new(params.require(:question).permit(:enigma, :votes, :user_id ,:topic_id, :answers_attributes => [:description]))
		@question.user_id = @user._id
		if @question.topic_id == nil
  			flash[:notice] = "You must select a topic catagory"
			render 'new'
		elsif @question.enigma == ""
			flash[:notice] = "You must enter a question"
			render 'new'
		elsif @question.answers.count < 2
			flash[:notice] = "You must have at least 2 answers"
			render 'new'
		elsif @question.save
			# @question.user_question.create(question_id: :id, user_id: :current_user)
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
		if @question.update_attributes(params.require(:question).permit(:enigma, :votes))
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
