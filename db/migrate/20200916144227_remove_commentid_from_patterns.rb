class RemoveCommentidFromPatterns < ActiveRecord::Migration[6.0]
  def change
    remove_column :patterns, :comment_id, :integer
  end
end
