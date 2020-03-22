class Pet < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :name,
                        :description,
                        :approximate_age,
                        :sex,
                        :adoption_status
end
