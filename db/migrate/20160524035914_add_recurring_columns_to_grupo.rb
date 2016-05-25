class AddRecurringColumnsToGrupo < ActiveRecord::Migration
  def change
    add_column :grupos, :recurring, :boolean
    add_column :grupos, :period, :string
    add_column :grupos, :cycles, :integer
  end
end
