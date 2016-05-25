class AddMoneyToTasks < ActiveRecord::Migration
  
  def change
    add_column :tasks, :money, :integer
  end

end
