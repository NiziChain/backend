class Secondary < ApplicationRecord
  belongs_to :author
  belongs_to :original

  validates :content_id, presence: true, numericality: { only_integer: true }
  validates :title, presence: true, length: { maximum: 30 }, uniqueness: true
  validates :description, presence: true, length: { maximum: 255 }
end
