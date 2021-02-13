class CreateRules < ActiveRecord::Migration[6.0]
  def change
    create_table :rules do |t|
      t.references :user,null: false, foreign_key: true
      t.string :if_1    
      t.string :then_1  
      t.string :if_2    
      t.string :then_2  
      t.string :if_3    
      t.string :then_3  
      t.string :if_4    
      t.string :then_4  
      t.string :if_5    
      t.string :then_5   
      t.timestamps
    end
  end
end
