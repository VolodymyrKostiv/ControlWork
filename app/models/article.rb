class Article < ApplicationRecord
    self.per_page = 5
    
    has_one_attached :image
    belongs_to :user
    has_many :comments, dependent: :destroy

    validates_presence_of :user_id
    validates :category_id, length: { minimum: 0 }, allow_nil: true

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
    validates_uniqueness_of :title
end