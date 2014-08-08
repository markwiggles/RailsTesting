class CreateUsers < ActiveRecord::Migration

  def up
    create_table :users, {:id => false} do |t|
      t.string 'mobile_number'
      t.string 'first_name'
      t.string 'last_name'
      t.string 'email'
      t.boolean 'admin_user', :default => false
      t.string 'password_digest'
      t.timestamps
    end
    execute "ALTER TABLE users ADD PRIMARY KEY(mobile_number,first_name);"
  end

  def down
    drop_table :users
  end
end
