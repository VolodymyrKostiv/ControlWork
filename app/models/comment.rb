class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  validates_presence_of :body, :user_id, :article_id
end
