class Book < ApplicationRecord
  belongs_to :blog
  validates_presence_of :title, :author, :percent_completed
end
