class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.references :user, index: true
      t.string :event
      t.string :references
      t.text :text

      t.timestamps
    end
  end
end
