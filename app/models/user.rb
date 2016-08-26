class User < ActiveRecord::Base
  #TODO set default user picture
  has_secure_password

  def self.confirm(params)
    @user = User.where("email ILIKE ?", params[:email]).first
    @user.try(:authenticate, params[:password])
  end
end
