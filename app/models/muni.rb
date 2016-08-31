class Muni < ActiveRecord::Base
  has_many :articles
  has_many :users, :through => :articles
  has_many :comments, :through => :articles

  extend FriendlyId
  friendly_id :name, use: :slugged
end
