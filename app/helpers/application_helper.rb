module ApplicationHelper
  # Great naming conventions in these helpers!

# TODO: Use parenthesis when a method takes parameters
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: 'alert') do
        concat message
      end)
    end
    nil
  end

  def auth_fail
    flash[:error] = "You cannot edit other people's posts!"
    redirect_to post_path
  end

  def article_sort_by_vote(articles)
    articles.each do |article|
      article.vote_total = article.comments.sum(:vote)
    end
    # TODO: Missing space after comma (should be |x, y|)
    articles.sort { |x,y| y.vote_total <=> x.vote_total }
  end

  def article_sort_by_vote_and_paginate(articles)
    # TODO: This assignment is useless; you can just return the formatted articles
    articles = article_sort_by_vote(articles).paginate(:page => params[:page], :per_page => 9)
  end
end
