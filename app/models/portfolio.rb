class Portfolio < ApplicationRecord
  belongs_to :blog
  validates_presence_of :title, :body, :main_image, :thumbnail
end
