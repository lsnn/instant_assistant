class AddAvailableToTasks < ActiveRecord::Migration
  
  def change
    add_column :tasks, :available, :boolean, default: true
    add_column :tasks, :assistant_id, :integer
  end
end
