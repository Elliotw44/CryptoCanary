class AddPoolToWorker < ActiveRecord::Migration
    def change
         rename_column :workers, :back_up_pool, :pool
         add_column :workers, :pool_online, :boolean
    end
end
