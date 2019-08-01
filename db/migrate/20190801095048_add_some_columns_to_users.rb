class AddSomeColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :website, :text
    add_column :users, :tel, :string
    add_column :users, :gender, :integer
  end
end
