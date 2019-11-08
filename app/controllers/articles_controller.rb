class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update

    @article = Article.find(params[:id])
    if !params[:article][:title].empty?
      @article.update(title: params[:article][:title], description: params[:article][:description])
    end

    if !params[:article][:description].empty?
        @article.update(description: params[:article][:description])
    end

    if @article.errors.any?
      redirect_to articles_path
    else
      redirect_to article_path(@article)
    end
  end

  # add edit and update methods here
end
