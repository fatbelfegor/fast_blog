# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  admin_id   :integer
#

class Post < ApplicationRecord

	extend FriendlyId
	friendly_id :title, use: :slugged

  validates :title, presence: true, length: {maximum: 140}
	validates :body, presence: true

	belongs_to :admin

	scope :most_recent, -> { order(published_at: :desc) }
  scope :published, -> { where(published: true) }

	def publish
      update(published: true, published_at: Time.now)
    end

    def unpublish
      update(published: false, published_at: nil)
    end


end
