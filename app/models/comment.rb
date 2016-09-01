class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  has_one :muni, :through => :articles

  before_save :default_values

  validates_numericality_of :vote, :only_integer => true, :allow_nil => true, :greater_than_or_equal_to => -1, :less_than_or_equal_to => 1

  private

  def default_values
    self.vote ||= 0
  end
end
