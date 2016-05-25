class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :full_name
      t.string :email
      t.string :phone
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
