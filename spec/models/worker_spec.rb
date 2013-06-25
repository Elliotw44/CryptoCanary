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
#  back_up_pool     :string(255)
#  worker_user_name :string(255)
#

require 'spec_helper'

describe Worker do
  pending "add some examples to (or delete) #{__FILE__}"
end
