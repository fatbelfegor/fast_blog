class Post < ApplicationRecord
  validates :title, presence: true, length: {maximum: 140}
	validates :body, presence: true

	extend FriendlyId
	friendly_id :title, use: :slugged


end
