class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.string :name
      t.text :message
      t.integer :user_id
      t.string :pattern_id
  
      t.timestamps
    end
  end
end
