class RenameCurrentShelterIdToCurrentShelter < ActiveRecord::Migration[5.1]
  def change
    rename_column :pets, :current_shelter_id, :current_shelter
  end
end
