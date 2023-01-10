class Signup < ApplicationRecord
  validate :time_is_valid

    def time_is_valid
        if time
        unless (time > -1 && time < 24)
            errors.add(:time, "must be between 0 and 23")
          end
        else
            errors.add(:time, "must be between 0 and 23")
        end

    end

    belongs_to :camper
    belongs_to :activity
end
