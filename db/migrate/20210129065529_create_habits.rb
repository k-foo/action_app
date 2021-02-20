class CreateHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :habits do |t|
      t.references :user,null: false, foreign_key: true
      t.boolean    :count_1
      t.boolean    :restart_1
      t.boolean    :count_2
      t.boolean    :restart_2
      t.boolean    :count_3
      t.boolean    :restart_3
      t.boolean    :count_4
      t.boolean    :restart_4
      t.boolean    :count_5
      t.boolean    :restart_5
      t.timestamps
    end
  end
end
