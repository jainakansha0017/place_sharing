class RemoveColumnFromPlaces < ActiveRecord::Migration[6.0]
  def change
    remove_column :places, :is_public
  end
end
