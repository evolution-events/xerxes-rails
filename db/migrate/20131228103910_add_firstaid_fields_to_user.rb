class AddFirstaidFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :firstaid, :boolean
    add_column :users, :bhv, :boolean
  end
end
