class MunisController < ApplicationController
  include AuthHelper

  def show
    @muni = Muni.find(params[:id])
    @articles = @muni.articles.paginate(:page => params[:page], :per_page => 9)
  end
end
