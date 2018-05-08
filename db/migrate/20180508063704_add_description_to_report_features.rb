class AddDescriptionToReportFeatures < ActiveRecord::Migration[5.2]
  def change
    add_column :report_features, :description, :text
  end
end
