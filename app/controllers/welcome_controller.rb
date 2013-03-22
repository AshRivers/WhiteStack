class WelcomeController < ApplicationController
  def main
  	@articles = Article.find(:all,order: "id DESC", limit: 3)
  	@comments = Comment.find(:all,order: "id DESC", limit: 2)
  end

  def about
  end

  def contact  	
  end
  
  def latest_comments
  	@comments = Comment.find(:all,order: "id DESC", limit: 2)
  end
end
