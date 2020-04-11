class CreateJoinTableUserPlace < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :places do |t|
      t.index [:user_id, :place_id]
      # t.index [:place_id, :user_id]
    end
  end
end
