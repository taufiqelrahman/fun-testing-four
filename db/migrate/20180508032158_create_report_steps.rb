class CreateReportSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :report_steps do |t|
      t.integer :report_scenario_id, null: true
      t.integer :step_id, null: true
      t.string  :state, default: :pending
      t.integer :user_id, null: true

      t.timestamps
      t.datetime :deleted_at
    end
    add_index :report_steps, [:id, :deleted_at]
    add_index :report_steps, [:report_scenario_id, :deleted_at]
    add_index :report_steps, [:step_id, :deleted_at]
  end
end
