class WelcomeController < ApplicationController
  
  def index
    @comments = Comment.order('created_at DESC').page(params[:page])
  end
end
