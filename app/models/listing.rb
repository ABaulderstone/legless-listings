class Listing < ApplicationRecord
  belongs_to :breed
  enum sex: {female: 0, male: 1}
  validates :title, :sex, :breed_id, :price, :deposit, :date_of_birth, presence: true
end
