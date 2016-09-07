class Article < ActiveRecord::Base
  # TODO: Remove your TODOs from produciton code!
  # TODO: add default article code

  has_uploadcare_file :file

  before_validation :default_values
  # TODO: Put some space inside of your curly brackets to boost legibility
  validates :title, length: { in: 2..75 }, presence: true
  validates :content, length: {in: 2..2000}, presence: true

  belongs_to :muni
  belongs_to :user
  has_many :comments

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  private

  def default_values
    # TODO: Add this image to assets to make your app more stable
    # TODO: You can use unless self.image instead of comparing to an empty string
    self.image = "https://ucarecdn.com/419db702-51f4-4665-a2ca-d23739a97b71/" if self.image == ""
  end

end
