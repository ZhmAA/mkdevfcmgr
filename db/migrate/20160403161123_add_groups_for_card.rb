class AddGroupsForCard < ActiveRecord::Migration
  def change
    add_column :cards, :group_num, :integer, default: 0
    add_column :cards, :try_num, :integer, default: 3
  end
end
