class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.string  :title
      t.integer :squad_id

      t.timestamps
      t.datetime :deleted_at
    end
    add_index :features, :deleted_at
  end
end
