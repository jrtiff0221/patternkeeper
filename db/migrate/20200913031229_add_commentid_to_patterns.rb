class AddCommentidToPatterns < ActiveRecord::Migration[6.0]
  def change
    add_column :patterns, :comment_id, :integer
  end
end
