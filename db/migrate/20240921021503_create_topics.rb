class CreateTopics < ActiveRecord::Migration[7.2]
  def change
    create_table :topics do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.boolean :is_locked, null: false
      t.boolean :is_sticky, null: false
      t.references :forum, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.timestamps
    end
    add_index :topics, [:forum_id, :created_at]
  end
end
