class MunisController < ApplicationController
  def show
    @muni = Muni.find_by_id(params[:id])
  end
end
