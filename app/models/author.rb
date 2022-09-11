class Author < ApplicationRecord
  has_many :originals, dependent: :destroy
  has_many :secondaries, dependent: :destroy
end
