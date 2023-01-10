class Camper < ApplicationRecord
  validates :name, presence: true
  # validates :age, length: {in: 8..18}
  validate :age_range

  def age_range
      unless (age > 7 && age < 19)
        errors.add(:age, "must be between 18 and 8")
      end
  end


  has_many :signups
  has_many :activities, through: :signups
end
