class ChangeCardParams < ActiveRecord::Migration
  def change
  	remove_column :cards, :group_num, :integer
    remove_column :cards, :try_num, :integer
    add_column :cards, :efact, :float, default: 2.5
    add_column :cards, :inter, :integer, default: 0
    add_column :cards, :sec, :integer
  end
end
