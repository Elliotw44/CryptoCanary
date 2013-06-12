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
#  user_id    :integer
#

class Worker < ActiveRecord::Base
  belongs_to :user
  attr_accessible :gput1, :gput2, :gput3, :gput4, :hashrate, :name, :online, :ip_address

  validates :name, presence: true, length: { maximum: 25 }
  validates :user_id, presence: true
  before_save :set_defaults
  private
  def set_defaults
      self.gput1 ||= 0  
      self.gput2 ||= 0 
      self.gput3 ||= 0
      self.gput4 ||= 0 
      self.hashrate ||= 0
      self.online ||= false
      self.ip_address ||= '0'
  end

end
