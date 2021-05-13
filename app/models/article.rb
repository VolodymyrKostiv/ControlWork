class Article < ApplicationRecord
    self.per_page = 10

    has_one_attached :image
    
    belongs_to :user
    has_many :comments, dependent: :destroy
    validates_presence_of :user_id
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
  end
  