class Payment < ActiveRecord::Base
  belongs_to :player
  belongs_to :travel

  validates_presence_of :payment_amount
  validates_presence_of :name
end
