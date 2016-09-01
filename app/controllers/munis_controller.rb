class MunisController < ApplicationController
  include AuthHelper

  def show
    @muni = Muni.find(params[:id])
    @articles = Article.where(:muni_id=>params[:id]).paginate(:page => params[:page], :per_page => 9)
  end
end
