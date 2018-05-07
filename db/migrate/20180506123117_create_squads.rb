class CreateSquads < ActiveRecord::Migration[5.2]
  def change
    create_table :squads do |t|
      t.string  :name
      t.text    :description

      t.timestamps
      t.datetime :deleted_at
    end
    add_index :squads, :deleted_at
  end
end
