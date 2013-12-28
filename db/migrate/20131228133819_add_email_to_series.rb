class AddEmailToSeries < ActiveRecord::Migration
  def change
    add_column :series, :email, :string
  end
end
