class RemovePublisheddateFromPatterns < ActiveRecord::Migration[6.0]
  def change
    remove_column :patterns, :published_date, :integer
  end
end
