class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :title
      t.integer :user_id
      t.boolean :current, default: false
      t.timestamps null: false
    end
  end
end
