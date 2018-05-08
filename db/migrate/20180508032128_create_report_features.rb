class CreateReportFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :report_features do |t|
      t.integer :feature_id, null: true
      t.string  :state, default: :pending
      t.integer :user_id, null: true

      t.timestamps
      t.datetime :deleted_at
    end
    add_index :report_features, [:id, :deleted_at]
    add_index :report_features, [:feature_id, :deleted_at]
  end
end
