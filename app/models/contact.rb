class Contact < ApplicationRecord
	validates :email, :title, :description, presence: true
	validates :email, :title, length: {in: 5..25}
end
