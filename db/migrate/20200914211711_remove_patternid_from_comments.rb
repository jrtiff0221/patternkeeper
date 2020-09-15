class RemovePatternidFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :pattern_id, :string
  end
end
