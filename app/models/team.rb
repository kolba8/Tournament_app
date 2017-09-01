class Team < ApplicationRecord
  has_and_belongs_to_many :tournaments

  validates :name, presence: true, uniqueness: true
  validates :city, presence: true
end
