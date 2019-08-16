class Category < ApplicationRecord
	has_many :has_categories
	has_many :articles, through: :has_categories
	belongs_to :user
	validates :name, presence: true 
end
