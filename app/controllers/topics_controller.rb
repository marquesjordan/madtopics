class TopicsController < ApplicationController
  def index
  	@topics = Topic.all
  end

  def new
  	@topic = Topic.new(params.require(:topic).permit(:name))
  	if @topic.save
  		redirect_to topics_path
  	else
  		render 'new'
  	end
  end

  def edit
  end
end
