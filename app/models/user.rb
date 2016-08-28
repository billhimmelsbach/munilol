class User < ActiveRecord::Base
  #TODO set default user picture
  has_secure_password

  validates :email, uniqueness: true, length: { in: 2..150}, presence: true
  validates :first_name, length: { in: 2..50}, presence: true
  validates :last_name, length: { in: 2..75}, presence: true
  # validates :image_url, format: {with: /\.(png|jpg)\Z/i}
  
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # before_create do
  #   set_default_image
  # end

  # extend FriendlyId
  # friendly_id :first_name, use: [:slugged, :finders]

  has_many :articles
  has_many :munis, :through => :articles
  has_many :comments, :through => :articles


  private

  # def set_default_image
  #   self.image = "https://cdn0.vox-cdn.com/images/verge/default-avatar.v9899025.gif" if self.image=""
  # end

  def self.confirm(params)
    @user = User.where("email ILIKE ?", params[:email]).first
    @user.try(:authenticate, params[:password])
  end
end
