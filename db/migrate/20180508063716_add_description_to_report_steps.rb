class AddDescriptionToReportSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :report_steps, :description, :text
  end
end
