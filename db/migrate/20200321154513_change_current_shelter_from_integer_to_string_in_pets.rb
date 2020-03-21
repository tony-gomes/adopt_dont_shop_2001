class ChangeCurrentShelterFromIntegerToStringInPets < ActiveRecord::Migration[5.1]
  def up
    change_column :pets, :current_shelter, :string
  end

  def down
    change_column :pets, :current_shelter, :integer
  end
end
