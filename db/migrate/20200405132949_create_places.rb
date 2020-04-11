class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.text :street
      t.string :city
      t.string :state
      t.string :country
      t.float :latitude
      t.float :longitude
      t.boolean :is_public
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
