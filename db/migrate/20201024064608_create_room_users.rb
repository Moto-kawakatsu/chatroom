class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      t.references :room, foreign_keys: true
      t.references :user, foreign_keys: true
      t.timestamps
    end
  end
end
