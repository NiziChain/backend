class Original < ApplicationRecord
  belongs_to :author
  has_many :secondaries, dependent: :destroy
end
