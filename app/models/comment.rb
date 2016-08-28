class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  has_one :muni, :through => :articles

  def up_vote
    self.vote=1
  end
  
  def clear_vote
    self.vote=0
  end

  def down_vote
    self.vote=-1
  end
  # @@vote_total = 0
  #
  # after_update do
  #   self.class.vote_total += self.vote
  # end
end
