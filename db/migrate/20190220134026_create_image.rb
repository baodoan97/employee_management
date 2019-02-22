class CreateImage < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
    t.integer :task_id
    end
  end
end
