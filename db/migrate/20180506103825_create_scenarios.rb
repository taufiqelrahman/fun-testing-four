class CreateScenarios < ActiveRecord::Migration[5.2]
  def change
    create_table :scenarios do |t|
      t.string  :title
      t.string  :available_on
      t.text    :description
      t.integer :user_id

      t.timestamps
      t.datetime :deleted_at
    end
    add_index :scenarios, :deleted_at
  end
end
