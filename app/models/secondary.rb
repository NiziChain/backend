class Secondary < ApplicationRecord
  belongs_to :author
  belongs_to :original
end
