class Book < ApplicationRecord

  validates_presence_of :title, :author, :percent_completed

end
