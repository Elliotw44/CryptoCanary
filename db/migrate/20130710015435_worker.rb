class Worker < ActiveRecord::Migration
    def change
       add_column :workers, :GPUT1, :integer
       add_column :workers, :GPUT2, :integer 
       add_column :workers, :GPUT3, :integer 
       add_column :workers, :GPUT4, :integer 
       add_column :workers, :GPUH1, :float 
       add_column :workers, :GPUH2, :float 
       add_column :workers, :GPUH3, :float 
       add_column :workers, :GPUH4, :float
    end
end
