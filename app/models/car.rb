class Car < ApplicationRecord
	has_many :likes, as: :likeable, dependent: :destroy
	has_many :reviews, dependent: :destroy
	belongs_to :user
	has_many_attached :images, dependent: :destroy
end
