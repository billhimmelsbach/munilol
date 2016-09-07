class MunisController < ApplicationController
  # TODO: Are you using AuthHelper in this controller?
  include AuthHelper
  include ApplicationHelper

  def show
    @muni = Muni.find(params[:id])
    @articles = article_sort_by_vote_and_paginate(@muni.articles)
  end
end
