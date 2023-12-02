class Bsd < ApplicationRecord
  validates :name, :description, presence: true
end
