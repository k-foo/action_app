class CreateObjectives < ActiveRecord::Migration[6.0]
  def change
    create_table :objectives do |t|
      t.references :user,        null: false, foreign_key: true
      t.string     :title,       null: false
      t.integer    :category_id, null: false
      t.text       :wish,        null: false
      t.text       :outcome,     null: false
      t.text       :obstacle,    null: false
      t.text       :plan,        null: false
      t.timestamps
    end
  end
end
