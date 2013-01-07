# encoding: UTF-8
class Expense < ActiveRecord::Base
  attr_accessible :comment, :cost, :store_id, :payment_type_id, :payment_at

  default_scope order("payment_at DESC")

  belongs_to :store
  belongs_to :payment_type

  validates :store_id, { :presence => true }
  validates :payment_at, { :presence => true }
  validates :payment_type_id, { :presence => true }
  validates :cost, { :presence => true, :numericality => { :if => :is_cost_blank? } }

  class << self
  	def sum(expenses)
  	  expenses.map(&:cost).sum
  	end
  end

  def is_cost_blank?
    !cost.blank?
  end
end
