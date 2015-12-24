class AddAvatarToCards < ActiveRecord::Migration
  def change
  	add_column :cards, :avatar, :string
  end
end
