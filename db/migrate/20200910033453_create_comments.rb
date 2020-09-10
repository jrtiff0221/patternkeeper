class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.string :name
      t.text :message
      t.integer :user_id
      t.string :pattern_id
      t.index ["pattern_id"], name: "index_comments_on_pattern_id"
      t.index ["user_id"], name: "index_comments_on_user_id"
      t.timestamps
    end
  end
end
