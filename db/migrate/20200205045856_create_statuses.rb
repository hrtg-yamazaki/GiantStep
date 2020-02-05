class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.integer   :sleep, null: false, default: 0
      t.integer   :study, null: false, default: 0
      t.integer   :exercise, null: false, default: 0
      t.integer   :diet, null: false, default: 0
      t.integer   :habit, null: false, default: 0
      t.integer   :aim, null: false, default: 0
      t.integer   :login, null: false, default: 0
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
