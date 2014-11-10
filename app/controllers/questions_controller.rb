class QuestionsController < ApplicationController

	# before_action :confirm_logged_in
	

	def index
		@topics = Topic.all
		# @questions = Question.all
		@user_answers = UserAnswer.all
		my_question_filter = params[:topicfilter]
			
		if my_question_filter
			if my_question_filter == "showall"
				@questions = Question.all
			else
				topic = Topic.where(:name => my_question_filter).last
			    @questions = Question.where(:topic_id => topic.id)
			end
		else
			@questions = Question.all	
		end

		# case my_question_filter
		# when "SHOW ALL"
		# 	@questions = Question.all
		# when "RELATIONSHIPS"
		# 	topic = Topic.where(:name => my_question_filter)
		#   	@questions = Question.where(:topic_id => topic.id)
		# when "RELIGION"
		# 	topic = Topic.where(:name => my_question_filter)
		#   	@questions = Question.where(:topic_id => topic.id)
		# when "POLITICS"
		# 	topic = Topic.where(:name => my_question_filter)
		#   	@questions = Question.where(:topic_id => topic.id)
		# when "SEX"
		# 	topic = Topic.where(:name => my_question_filter)
		#   	@questions = Question.where(:topic_id => topic.id)
		# when "RACE"
		# 	topic = Topic.where(:name => my_question_filter)
		#   	@questions = Question.where(:topic_id => topic.id)
		# when "HOMOSEXUALITY"
		# 	topic = Topic.where(:name => my_question_filter)
		#   	@questions = Question.where(:topic_id => topic.id)
		# when "LIFE"
		# 	topic = Topic.where(:name => my_question_filter)
		#   	@questions = Question.where(:topic_id => topic.id)
		# when "DEATH"
		# 	topic = Topic.where(:name => my_question_filter)
		#   	@questions = Question.where(:topic_id => topic.id)
		# when "SCHOOL"
		# 	topic = Topic.where(:name => my_question_filter)
		#   	@questions = Question.where(:topic_id => topic.id)
		# when "COLLEGE"
		# 	topic = Topic.where(:name => my_question_filter)
		#   	@questions = Question.where(:topic_id => topic.id)
		# when "WOMEN"
		# 	topic = Topic.where(:name => my_question_filter)
		#   	@questions = Question.where(:topic_id => topic.id)
		# when "MEN"
		# 	topic = Topic.where(:name => my_question_filter)
		#   	@questions = Question.where(:topic_id => topic.id)
		# when "MARIJUANA"
		# 	topic = Topic.where(:name => my_question_filter)
		#   	@questions = Question.where(:topic_id => topic.id)
		# when "LIQOUR"
		# 	topic = Topic.where(:name => my_question_filter)
		#   	@questions = Question.where(:topic_id => topic.id)
		# when "HEALTH"
		# 	topic = Topic.where(:name => my_question_filter)
		#   	@questions = Question.where(:topic_id => topic.id)
		# when "TECHNOLOGY"
		# 	topic = Topic.where(:name => my_question_filter)
		#   	@questions = Question.where(:topic_id => topic.id)
		# when "TRAVEL"
		# 	topic = Topic.where(:name => my_question_filter)
		#   	@questions = Question.where(:topic_id => topic.id)
		# when "FOOD"
		# 	topic = Topic.where(:name => my_question_filter)
		#   	@questions = Question.where(:topic_id => topic.id)
		# else 
		# 	@questions = Question.all
		# end

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
		# raise params.inspect
		# if params[:engima] == ""
		# 	render 'new'
		# else
			@question = Question.create(params.require(:question).permit(:enigma, :votes, :user_id ,:topic_id, :answers_attributes => [:description]))
			@question.user_id = @user._id
			if @question.save
				redirect_to questions_path
			else
				flash[:notice] = "Must Select A Topic & Ask a Question - Answers Need Between 2 & 100 Characters"
				# flash[:notice] = @question.errors.messages[:answers]
				render 'new'
			end
		# end
	
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
