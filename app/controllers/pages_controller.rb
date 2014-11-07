class PagesController < ApplicationController
  skip_before_filter :authorize

  def home
  @user = User.new
  end


end
