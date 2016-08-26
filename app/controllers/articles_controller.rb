class ArticlesController < ApplicationController

#TODO should I remove the contextual reasons why a user isn't able to do an action on a route?

  def splash
    @articles = Article.all
    render :splash
  end

  def show
    set_article
  end

  def edit
    if auth_route(@user)
      render :edit
    else
      auth_fail("edit other people's articles!", article_path)
    end
  end

  def update
    set_article
    if auth_through_article
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
    if auth_through_article
      @user = @article.user
      @article.destroy
      flash[:success] = "Your article titled \"#{@article.title}\ was deleted."
      redirect_to user_path(@user)
    else
      auth_fail("delete other people's articles", article_path)
    end
  end

private

  def article_params
    params.require(:article).permit(:title, :content, :image)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
