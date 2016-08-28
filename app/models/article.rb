class Article < ActiveRecord::Base
  #TODO add default article code

  belongs_to :muni
  belongs_to :user
  has_many :comments

  before_create do
    p "XXXXXXXXXX"
    set_default_image
  end

  def set_default_image
    self.image ||= "https://upload.wikimedia.org/wikipedia/en/thumb/b/b2/SFMuni_Worm.svg/1280px-SFMuni_Worm.svg.png" if self.image=""
  end

  # validates :title, length: {in: 2..200}, presence: true
end
