class ArticlesController < ApplicationController
=begin
  We want the user to be authenticated on every action except index and show
=end
  http_basic_authenticate_with name: "hieuho", password: "230495", except: [:index, :show]

=begin
  Show all articles 
=end
  def index
    @articles = Article.all
  end

=begin
  Only show an article bases on its ID
=end
  def show
    # params[:id] : to get the :id parameter from the request
    # @article : instance variable, to hold a reference to the article object.
    # We do this because Rails will pass all instance variables to the view
    @article = Article.find(params[:id])
  end

=begin
  Show article form allows users can fill their data
=end
  def new
    @article = Article.new #if remove this command then nil:NilClass error will be shown at new.html.erb template
  end

=begin
  Editting an article base on it's ID 
=end
  def edit
    @article = Article.find(params[:id])
  end

=begin
  Process and save data to database
=end
  def create
    #render plain: params[:article].inspect #be used to show params

    #save data from form into database
    #@article = Article.new(params[:article]) #not secure
    #@article = Article.new(params.require(:article).permit(:title, :text)) #secure, WHY ???
    @article = Article.new(article_params)
    #@article.save #return a boolean indicating whether the artice was saved or not
    #redirect_to @article
    
    # Notice that:
    # - Using render instead of redirect_to when save returns false
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
      @article.destroy
 
      redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
