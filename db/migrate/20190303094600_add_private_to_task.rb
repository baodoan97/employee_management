class AddPrivateToTask < ActiveRecord::Migration[5.2]
  def change
  	add_column :tasks, :private, :boolean, default: true
  end
end
