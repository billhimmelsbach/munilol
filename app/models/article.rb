class Article < ActiveRecord::Base
  #TODO add default article code

  belongs_to :muni
  belongs_to :user
  has_many :comments

  after_update do
    set_default_image
  end

  # def set_default_image
  # self.image ||= "DEFAULT_ARTICLE_URL"
  # end

  # validates :title, length: {in: 2..200}, presence: true
end
