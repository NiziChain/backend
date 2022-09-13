class Secondary < ApplicationRecord
  belongs_to :author
  belongs_to :original

  validates :content_id, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 9999999999 }, uniqueness: true
  validates :title, presence: true, length: { maximum: 30 }, uniqueness: true
  validates :description, presence: true, length: { maximum: 255 }
end
