class RemoveEventfromDiscussions < ActiveRecord::Migration
  def change
  	remove_column :discussions, :event, :string
  end
end
