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

class Worker < ActiveRecord::Base
  belongs_to :user
  attr_accessible :accepted, :rejected, :hw_errors, :num_gpu, :hashrate, :name, :online, :back_up_pool, :worker_user_name
  validates :name, presence: true, length: { maximum: 25 }
  validates :user_id, presence: true
end
