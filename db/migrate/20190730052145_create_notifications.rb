class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :post_id
      t.integer :like_user_id
      t.integer :comment_user_id
      t.references :user, foreign_key: true
      t.boolean :already, default: false

      t.timestamps
    end
  end
end
