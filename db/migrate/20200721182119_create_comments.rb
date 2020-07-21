class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :word_id 
      t.integer :user_id 
      t.string :content  
      t.boolean :public, default: false
      t.timestamps 
    end
  end
end
