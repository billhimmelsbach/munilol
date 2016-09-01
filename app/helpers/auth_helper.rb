module AuthHelper

  def auth_route(user)
    current_user != nil && current_user.id == user.id
  end

  def auth_fail(reason_for_failure, redirect_path)
    flash[:error] = "You can't " + reason_for_failure
    redirect_to redirect_path
  end
end
