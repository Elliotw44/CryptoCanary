class AddUserIdToWorker < ActiveRecord::Migration
  def change
    add_column :workers, :user_id, :integer
    add_index :workers, [:user_id]
  end
end
