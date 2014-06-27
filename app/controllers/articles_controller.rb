class ArticlesController < ApplicationController
  
=begin
 list all articles 
=end  
  def index
    @articles = Article.all
  end
  
=begin
 show a single article 
=end
  def show
    @article = Article.find(params[:id])
  end
  
=begin
 void method to display new article form 
=end
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
  
  
# PRIVATE ---------------------------------------------------
  
  private
  
  def article_params
    params.require(:article).permit(:title,:text)
  end
end
