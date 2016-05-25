class CreateAssistants < ActiveRecord::Migration
  def change
    create_table :assistants do |t|
      t.string :first_name
      t.string :last_name_string
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
