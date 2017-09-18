class Tournament < ApplicationRecord
  has_and_belongs_to_many :teams
  has_many :matches, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :city, presence: true

  validate :end_date_cant_be_earlier_than_start_date

  def end_date_cant_be_earlier_than_start_date
    if start_date > end_date
      errors.add(:end_date, "must be at the same day or later than start_date")
    end
  end
end
