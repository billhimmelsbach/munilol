class Article < ActiveRecord::Base
  #TODO add default article code

  has_uploadcare_file :file

  before_validation :default_values

  validates :title, length: {in: 2..75}, presence: true
  validates :content, length: {in: 2..2000}, presence: true

  belongs_to :muni
  belongs_to :user
  has_many :comments

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  # example of a custom scope
  # this behaves just like a class method, with the advantage that we can "chain" off our query
  scope :with_vote_counts, -> {
    joins(:comments)
      .select("articles.*, SUM(comments.vote) as vote_total")
      .group("articles.id")
      .order("articles.vote_total DESC")
  }

  # example Article class method
  # def self.by_vote
  #   all.sort { |x,y| y.vote_total <=> x.vote_total} # TODO: inefficient in-memory sort!
  # end

  # example article instance method, with caching
  # def vote_total
  #   @vote_total ||= comments.sum(:vote) # but watch out this count is stale!
  # end


  private

  def default_values
    self.image = "https://ucarecdn.com/419db702-51f4-4665-a2ca-d23739a97b71/" if self.image == ""
  end

end
