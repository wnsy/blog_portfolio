class Blog < ApplicationRecord
  extend FriendlyId
  belongs_to :category, optional: true
  friendly_id :title, use: :slugged

  enum status: { draft: 0, published: 1}

  validates_presence_of :title, :body
end
