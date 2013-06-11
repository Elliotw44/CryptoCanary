class ChangeCoinsToStringForUsers < ActiveRecord::Migration
  change_table :users do |u|
      u.remove :coins
      u.string :coins
  end
end
