class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
    	t.text :original_text
    	t.text :translated_text
    	t.datetime :review_date
    	t.integer :user_id

      	t.timestamps null: false
    end
  end
end
