# == Schema Information
#
# Table name: workers
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  hashrate         :float
#  online           :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#  accepted         :integer
#  rejected         :integer
#  hw_errors        :integer
#  num_gpu          :integer
#  pool             :string(255)
#  worker_user_name :string(255)
#  GPUT1            :integer
#  GPUT2            :integer
#  GPUT3            :integer
#  GPUT4            :integer
#  GPUH1            :float
#  GPUH2            :float
#  GPUH3            :float
#  GPUH4            :float
#  pool_online      :boolean
#

require 'spec_helper'

describe Worker do
  pending "add some examples to (or delete) #{__FILE__}"
end
