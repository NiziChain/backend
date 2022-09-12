class Original < ApplicationRecord
  belongs_to :author
  has_many :secondaries, dependent: :destroy

  validates :content_id, numericality: { only_integer: true }
  validates :title, length: { maximum: 30 }, uniqueness: true
  validates :description, length: { maximum: 255 }
end
