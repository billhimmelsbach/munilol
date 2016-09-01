class ArticlesController < ApplicationController
  include AuthHelper
#TODO should I remove the contextual reasons why a user isn't able to do an action on a route?

  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 9)
    @munis = Muni.all
    render :index
  end

  def show
    @article = Article.find(params[:id])
    @vote_total = @article.comments.sum(:vote)
    return if current_user.nil?
    @comment = Comment.where(:article_id=>params[:id]).where(:user_id=>current_user.id)[0]
    @comment = Comment.new if @comment.nil?
    @comment.user_id = current_user.id
    @comment.article_id = @article.id
    @comment.save
  end

  def new
    @article = Article.new
    render :new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = session[:user_id]
    @muni = Muni.find(@article.muni_id)
    if @article.save
      @muni.articles.push(@article)
      flash[:success] = "Your article titled \"#{@article.title}\" was successfully created"
      redirect_to article_path(@article)
    else
      flash[:notice] = "Cannot create your post: #{@article.errors.full_messages.join(', ')}."
      redirect_to new_article_path
    end
  end

  def edit
    @article = Article.find(params[:id])
    auth_fail("edit other people's article information!", @article) if !auth_route(@article.user)
  end

  def update
    set_article
    if auth_route(@article.user)
      if @article.update(article_params)
        flash[:success] = "#{@article.title} successfully updated"
        redirect_to article_path
      else
        render :edit
      end
    else
      auth_fail("update other people's articles", article_path)
    end
  end

  def destroy
    set_article
    if auth_route(@article.user)
      @user = @article.user
      @article.destroy
      flash[:success] = "Your article titled \"#{@article.title}\" was deleted."
      redirect_to user_path(@user)
    else
      auth_fail("delete other people's articles", article_path)
    end
  end

private

  def article_params
    params.require(:article).permit(:title, :content, :image, :muni_id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
