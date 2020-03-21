class Pet < ApplicationRecord
  validates_presence_of :name,
                        :description,
                        :approximate_age,
                        :sex,
                        :adoption_status,
                        :current_shelter_id
end
