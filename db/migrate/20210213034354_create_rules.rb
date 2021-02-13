class CreateRules < ActiveRecord::Migration[6.0]
  def change
    create_table :rules do |t|

      t.timestamps
    end
  end
end
