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
#

class Worker < ActiveRecord::Base
  belongs_to :user
  attr_accessible :gput1, :gput2, :gput3, :gput4, :hashrate, :name, :online

  validates :name, presence: true, length: { maximum: 25 }

  after_initialize :set_defaults
  private
  def set_defaults
      self.gput1 = 0 if self.new_record?
      self.gput2 = 0 if self.new_record?
      self.gput3 = 0 if self.new_record?
      self.hashrate = 0 if self.new_record?
      self.online = false if self.new_record?
  end

end
