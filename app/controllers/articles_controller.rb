class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy, :edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit]
  #before_action :authenticate_user!, only: [:index, :show]
  before_action :authenticate_editor?,  only: [:new, :create, :edit, :update]
  before_action :authenticate_admin?, only: [:destroy]  

  def search
    if params.has_key?(:search)
      @articles = Article.titulo(params[:search])
    elsif params[:search].length == 0
      @articles = Article.all
    end
  end

  def index
  	@articles = Article.all
    if user_signed_in? && (current_user.is_admin?)
      render "admin_articles"
    end
  end

  def new
  	@article = Article.new
  end

  def create
    if params[:categories].nil?
      redirect_to new_article_path, alert: "Debes seleccionar una categoría"
    else
      @article = current_user.articles.create(article_params)
      @article.categories = params[:categories]
      if @article.save
        redirect_to @article
      else
        redirect_to current_user.articles.new
      end
    end
  end


  def show 
    @comments = Comment.all
  end

 
  def update
    @article.update(article_params)
    @article.save
    redirect_to @article
  end

  def edit  
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
  	params.require(:article).permit(:title, :body, :categories)
  end

  def set_article
    begin
      @article = Article.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert:"Este artículo no existe!"
    end
  end

  def set_categories
    @categories = Category.all
  end
end

