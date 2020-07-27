class CreateListwords < ActiveRecord::Migration[6.0]
  def change
    create_table :listwords do |t|
      t.integer :savedword_id 
      t.integer :savelist_id 
      
      t.timestamps
    end
  end
end
