class AddDescriptionToReportScenarios < ActiveRecord::Migration[5.2]
  def change
    add_column :report_scenarios, :description, :text
  end
end
