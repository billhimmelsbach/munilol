class User < ActiveRecord::Base
  #TODO set default user picture
  has_secure_password

  # extend FriendlyId
  # friendly_id :first_name, use: [:slugged, :finders]

  has_many :articles
  has_many :munis, :through => :articles
  has_many :comments, :through => :articles

  # validates :email, uniqueness: true
  # validates :first_name, length: { in: 2..30}, presence: true
  # validates :last_name, length: { in: 2..30}, presence: true

  def self.confirm(params)
    @user = User.where("email ILIKE ?", params[:email]).first
    @user.try(:authenticate, params[:password])
  end
end
