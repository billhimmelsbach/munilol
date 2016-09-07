class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  # TODO: SessionsHelper isn't needed here, you aren't using any of its
  #       functionalities
  include SessionsHelper

  before_filter :set_munis

  def set_munis
    @munis ||= Muni.all
  end
end
