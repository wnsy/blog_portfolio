class Portfolio < ApplicationRecord
  include Placeholder

  validates_presence_of :title, :body, :main_image, :thumbnail
  after_initialize :set_defaults

  scope :rails, -> { (where(subtitle: 'Rails')) }
  scope :react, -> { (where(subtitle: 'React')) }

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumbnail ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
