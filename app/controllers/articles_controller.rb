class ArticlesController < ApplicationController
  include AuthHelper
#TODO should I remove the contextual reasons why a user isn't able to do an action on a route?

  def index
    @articles = Article.all
    @articles = @articles.order("created_at desc")
    @munis = Muni.all
    render :index
  end

  def show
    @vote_total = Article.first.comments.sum(:vote)
    @article = Article.find_by_id(params[:id])
    @comment = Comment.where(:article_id=>params[:id]).where(:user_id=>current_user.id)[0]
    p "WUUUUUUUT"
    p @comment
    p @comment.vote
  end

  def new
    @article = Article.new
    render :new
  end

  def create
    # @muni = article_params.muni_id
    @article = Article.new(article_params)
    @article.user_id = session[:user_id]
    @muni = Muni.find(@article.muni_id)
    if @article.image == ""
      @article.image = "https://upload.wikimedia.org/wikipedia/en/thumb/b/b2/SFMuni_Worm.svg/1280px-SFMuni_Worm.svg.png"
    end
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
    @article = Article.find_by_id(params[:id])
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
    @article = Article.find_by_id(params[:id])
  end

end
