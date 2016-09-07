class AboutController < ApplicationController
  # TODO: Is this a show action or about action? I'd argue that it's more
  #       restful to call this the about#index and about#show would be an about
  #       page for a single developer.
  def show
    render :about
  end
end
