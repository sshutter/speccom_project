class Item < ApplicationRecord
    belongs_to :user
    has_many :inventory
    has_many :marketplace
    # has_one_attached :image
end
