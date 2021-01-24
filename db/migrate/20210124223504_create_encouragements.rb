class CreateEncouragements < ActiveRecord::Migration[6.0]
  def change
    create_table :encouragements do |t|

      t.timestamps
    end
  end
end
