class Portfolio < ApplicationRecord

  has_many :technologies, dependent: :destroy
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  validates_presence_of :title, :body

  scope :rails, -> { (where(subtitle: 'Rails')) }
  scope :react, -> { (where(subtitle: 'React')) }
  scope :by_position, -> { (order("position ASC")) }

  mount_uploader :thumbnail, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader
end
