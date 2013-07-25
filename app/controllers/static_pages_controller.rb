class StaticPagesController < ApplicationController
  def search_user
	   @users = User.all
  end

  def about
  end
end
