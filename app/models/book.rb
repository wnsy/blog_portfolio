class Book < ApplicationRecord
  include Placeholder

  validates_presence_of :title, :author, :percent_completed
  after_initialize :set_defaults

  def set_defaults
    self.img ||= Placeholder.image_generator(height: '250', width: '250')
  end
end
