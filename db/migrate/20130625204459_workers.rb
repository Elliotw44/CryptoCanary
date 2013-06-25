class Workers < ActiveRecord::Migration
  def change
      change_table :workers do |w|
        w.remove :gput1, :gput2, :gput3, :gput4, :ip_address
        w.integer :accepted, :rejected, :errors, :num_gpu
        w.string :back_up_pool, :worker_user_name
      end
  end
end
