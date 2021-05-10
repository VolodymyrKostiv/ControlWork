class Article < ApplicationRecord
    self.per_page = 1

    belongs_to :user
    has_many :comments, dependent: :destroy
    validates_presence_of :user_id
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
  end
  