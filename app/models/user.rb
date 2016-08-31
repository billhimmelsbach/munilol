class User < ActiveRecord::Base
  #TODO set default user picture
  has_secure_password
  extend FriendlyId

  before_validation :default_values


  friendly_id :full_name, use: [:slugged, :finders]



  validates :email, uniqueness: true, length: { in: 2..150}, presence: true
  validates :first_name, length: { in: 2..50}, presence: true
  validates :last_name, length: { in: 2..75}, presence: true

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :articles
  has_many :munis, :through => :articles
  has_many :comments, :through => :articles

  private

  def default_values
    self.image = "https://ucarecdn.com/1386c488-f2db-4b63-959f-32656a7e35c6/" if self.image == ""
    self.full_name = "#{self.first_name} #{self.last_name}"
  end


  def self.confirm(params)
    @user = User.where("email ILIKE ?", params[:email]).first
    @user.try(:authenticate, params[:password])
  end

  # def should_generate_new_friendly_id?
  #   slug.blank? || username_changed?
  # end

end
