class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  has_one :muni, :through => :articles
end
