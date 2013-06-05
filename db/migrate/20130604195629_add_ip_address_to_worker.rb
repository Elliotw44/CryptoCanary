class AddIpAddressToWorker < ActiveRecord::Migration
  def change
    add_column :workers, :ip_address, :string
  end
end
