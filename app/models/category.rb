class Category < ApplicationRecord
    has_many :articles
    validates_presence_of :name
    validates_uniqueness_of :name
end
