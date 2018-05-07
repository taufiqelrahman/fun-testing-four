class DropScrenariosSteps < ActiveRecord::Migration[5.2]
  def change
    drop_table :screnarios_steps
  end
end
