class CreateSavedwords < ActiveRecord::Migration[6.0]
  def change
    create_table :savedwords do |t|

      t.integer :word_id 
      t.integer :user_id 
      t.string :notes 
      t.timestamps
    end
  end
end
