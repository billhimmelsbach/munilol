class Article < ActiveRecord::Base
  #TODO add default article code
  validates :title, length: {in: 2..200}, presence: true
  validates :content, length: {in: 2..2000}, presence: true

  before_create do
    set_default_image
  end

  belongs_to :muni
  belongs_to :user
  has_many :comments

private

  def set_default_image
    self.image ||= "https://upload.wikimedia.org/wikipedia/en/thumb/b/b2/SFMuni_Worm.svg/1280px-SFMuni_Worm.svg.png" if self.image=""
  end

end
