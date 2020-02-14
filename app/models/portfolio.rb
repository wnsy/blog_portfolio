class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumbnail
  after_initialize :set_defaults

  scope :rails, -> { (where(subtitle: 'Rails')) }
  scope :react, -> { (where(subtitle: 'React')) }

  def set_defaults
    self.main_image ||= "http://placehold.it/600x400"
    self.thumbnail ||= "http://placehold.it/350x200"
  end
end
