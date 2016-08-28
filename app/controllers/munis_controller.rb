class MunisController < ApplicationController
  include AuthHelper

  def show
    @muni = Muni.find_by_id(params[:id])
    @articles = @muni.articles.order("created_at desc")
  end
end
