class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.string  :title
      t.string  :available_on
      t.integer :user_id

      t.timestamps
    end
  end
end
