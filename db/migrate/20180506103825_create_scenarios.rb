class CreateScenarios < ActiveRecord::Migration[5.2]
  def change
    create_table :scenarios do |t|
      t.string  :title
      t.string  :available_on
      t.text    :description
      t.integer :user_id

      t.timestamps
    end
  end
end
