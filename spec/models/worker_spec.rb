# == Schema Information
#
# Table name: workers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  hashrate   :float
#  online     :boolean
#  gput1      :integer
#  gput2      :integer
#  gput3      :integer
#  gput4      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  ip_address :string(255)
#

require 'spec_helper'

describe Worker do
  pending "add some examples to (or delete) #{__FILE__}"
end
