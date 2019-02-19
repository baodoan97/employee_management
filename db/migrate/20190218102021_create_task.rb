class CreateTask < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
    	t.string :taskname
    end
  end
end
