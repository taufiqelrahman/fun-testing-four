class CreateReportScenarios < ActiveRecord::Migration[5.2]
  def change
    create_table :report_scenarios do |t|
      t.integer :report_feature_id, null: true
      t.integer :scenario_id, null: true
      t.string  :state, default: :pending
      t.integer :user_id, null: true

      t.timestamps
      t.datetime :deleted_at
    end
    add_index :report_scenarios, [:id, :deleted_at]
    add_index :report_scenarios, [:report_feature_id, :deleted_at]
    add_index :report_scenarios, [:scenario_id, :deleted_at]
  end
end
