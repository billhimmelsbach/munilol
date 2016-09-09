class MunisController < ApplicationController
  include AuthHelper
  include ApplicationHelper

  def show
    @muni = Muni.find(params[:id])
    @articles = @muni.articles.with_vote_counts.paginate(:page => params[:page], :per_page => 9)
  end
end
