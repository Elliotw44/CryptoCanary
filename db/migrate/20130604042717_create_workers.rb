class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :name
      t.float :hashrate
      t.boolean :online
      t.integer :gput1
      t.integer :gput2
      t.integer :gput3
      t.integer :gput4

      t.timestamps
    end
  end
end
