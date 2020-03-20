class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :profile_img
      t.string :name
      t.string :description
      t.string :approximate_age
      t.string :sex
      t.string :adoption_status
      t.integer :current_shelter_id

      t.timestamps
    end
  end
end
