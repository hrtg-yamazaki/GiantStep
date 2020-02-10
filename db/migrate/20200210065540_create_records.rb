class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.integer   :sleep, null: false
      t.integer   :study, null: false
      t.integer   :exercise, null: false
      t.integer   :diet, null: false
      t.integer   :habit, null: false
      t.integer   :aim, null: false
      t.integer   :login, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
