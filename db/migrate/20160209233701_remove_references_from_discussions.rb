class RemoveReferencesFromDiscussions < ActiveRecord::Migration
  def change
    remove_column :discussions, :references, :string
  end
end
