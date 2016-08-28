class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  has_one :muni, :through => :articles

  # def self.up_vote
  #   self.vote = 1
  # end
  #
  # def self.clear_vote
  #   self.vote=0
  # end
  #
  # def self.down_vote
  #   self.vote=-1
  # end
  # @@vote_total = 0
  #
  # after_update do
  #   self.class.vote_total += self.vote
  # end
end
