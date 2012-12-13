class Expense < ActiveRecord::Base
  attr_accessible :comment, :cost, :store_id

  belongs_to :store

  validates :store, { :presence => true }
  validates :cost, { :presence => true, :numericality => true }

  class << self
  	def sum(expenses)
  	  expenses.map(&:cost).sum
  	end
  end
end
