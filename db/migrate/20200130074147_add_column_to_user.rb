class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile, :text, null: false, default: ''
    add_column :users, :birthday, :date, null: false
    add_column :users, :gender, :integer, null: false, default: 0
  end
end
