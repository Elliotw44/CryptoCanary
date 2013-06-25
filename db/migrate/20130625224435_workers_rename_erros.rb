class WorkersRenameErros < ActiveRecord::Migration
    def change
        change_table :workers do |w|
            w.rename :errors, :hw_errors
        end
    end 
end
