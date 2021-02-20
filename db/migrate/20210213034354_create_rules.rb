class CreateRules < ActiveRecord::Migration[6.0]
  def change
    create_table :rules do |t|
      t.references :user,null: false, foreign_key: true
      t.string :if_1,    null: false
      t.string :then_1,  null: false
      t.string :if_2,    null: false
      t.string :then_2,  null: false
      t.string :if_3,    null: false
      t.string :then_3,  null: false
      t.string :if_4,    null: false
      t.string :then_4,  null: false
      t.string :if_5,    null: false
      t.string :then_5,  null: false
      t.timestamps
    end
  end
end
