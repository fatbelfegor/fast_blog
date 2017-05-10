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
	acts_as_taggable # Alias for acts_as_taggable_on :tags

	extend FriendlyId
	friendly_id :title, use: :slugged

  validates :title, presence: true, length: {maximum: 140}
	validates :body, presence: true

	belongs_to :admin

	PER_PAGE = 3

	scope :most_recent, -> { order(published_at: :desc) }
  scope :published, -> { where(published: true) }
  scope :recent_paginated, -> (page) { most_recent.paginate(page: page, per_page: PER_PAGE) }
  scope :with_tag, -> (tag) { tagged_with(tag) if tag.present? }

  scope :list_for, -> (page, tag) do
    recent_paginated(page).with_tag(tag)
	end

	def publish
      update(published: true, published_at: Time.now)
  end

  def unpublish
    update(published: false, published_at: nil)
  end


end
