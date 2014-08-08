class CreateTasks < ActiveRecord::Migration
  def up
    create_table :tasks do |t|
      t.string 'user_id'
      t.string 'task_name'
      t.string 'type'
      t.date 'due_date'
      t.integer 'duration'
      t.timestamps
    end
  end

  def down
    drop_table :tasks
  end
end
