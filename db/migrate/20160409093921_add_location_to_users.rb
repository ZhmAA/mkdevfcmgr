class AddLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string, default: 'en'
  end
end
