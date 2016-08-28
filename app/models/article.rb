class Article < ActiveRecord::Base
  #TODO add default article code
  validates :title, length: {in: 2..75}, presence: true
  validates :content, length: {in: 2..2000}, presence: true
  validates :image, presence: true

  belongs_to :muni
  belongs_to :user
  has_many :comments
  
end
