class StaticPagesController < ApplicationController
  def search_user
	   @users = User.all
           @users.sort! { |a,b| a.name.downcase <=> b.name.downcase }
  end

  def about
  end
end
