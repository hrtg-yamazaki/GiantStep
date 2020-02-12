class CreateYardsticks < ActiveRecord::Migration[5.2]
  def change
    create_table :yardsticks do |t|
      t.string   :sleep, null: false
      t.string   :study, null: false
      t.string   :exercise, null: false
      t.string   :diet, null: false
      t.string   :habit, null: false
      t.string   :aim, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
