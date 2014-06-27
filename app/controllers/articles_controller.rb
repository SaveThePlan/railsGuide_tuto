# 
#  articles_controller.rb
#  railsGuide
#  
#  Created by Nanook on 2014-06-27.
#  Copyright 2014 Nanook. All rights reserved.
# 

class ArticlesController < ApplicationController

# articles_path  
  def index
    @articles = Article.all
  end
  
# article_path(:article)
  def show
    @article = Article.find(params[:id])
  end
  
# new_article_path
  def new
    @article = Article.new #load validation infos to check data form
  end
  
=begin
 save a new article
 only POST HTTP request 
=end
  def create
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to @article
    else
      render 'new' #to reload 'new' form with current @article data
    end
      
  end
  
# edit_article_path  
  def edit
    @article = Article.find(params[:id]) #load existing article
  rescue ActiveRecord::RecordNotFound
    #cath error if article not found
    redirect_to articles_path
  end
  
=begin
 update an article
 only with PATCH or PUT HTTP request 
=end
  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params) #passing here a hash with data to update, ie {title: 'toto'} only update title
      redirect_to @article
    else
      render 'edit'
    end
  end
  
# article_path(:article), method: :delete
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    redirect_to articles_path
  end
  
# PRIVATE ---------------------------------------------------
  
  private
  
  def article_params
    params.require(:article).permit(:title,:text)
  end
  
end
