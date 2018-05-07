class CreateFeaturesScenarios < ActiveRecord::Migration[5.2]
  def change
    create_table :features_scenarios do |t|
      t.integer :feature_id
      t.integer :scenario_id
      t.boolean :active

      t.timestamps
    end
  end
end
