class AddPatternidToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :pattern_id, :integer
  end
end
