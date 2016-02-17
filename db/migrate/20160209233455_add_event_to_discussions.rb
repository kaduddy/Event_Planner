class AddEventToDiscussions < ActiveRecord::Migration
  def change
    add_reference :discussions, :event, index: true
  end
end
