module SessionsHelper
  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

# TODO: I suspect that logged_in? and logged_in could be consolidated into
#       one function fairly easily. 
  def logged_in?
# TODO: Write if !current_user or unless current_user instead of comparing to nil
#       You could also use current_user.nil?
    if current_user == nil
      redirect_to login_url
    end
  end

  def logged_in
    # TODO: Watch your indentation
     unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
     end
  end

  def logout
    @current_user = session[:user_id] = nil
  end
end
