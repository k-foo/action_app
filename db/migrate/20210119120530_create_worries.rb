class CreateWorries < ActiveRecord::Migration[6.0]
  def change
    create_table :worries do |t|

      t.timestamps
    end
  end
end
