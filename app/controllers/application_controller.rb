class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter :set_munis

  def set_munis
    @munis ||= Muni.all
  end

  def not_found
    render :not_found
  end
end
