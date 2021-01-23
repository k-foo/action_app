class CreateTroubles < ActiveRecord::Migration[6.0]
  def change
    create_table :troubles do |t|
      t.references :user, null: false, foreign_key: true
      t.text       :worry
      t.timestamps
    end
  end
end
