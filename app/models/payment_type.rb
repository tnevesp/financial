# encoding: UTF-8
class PaymentType < ActiveRecord::Base
  attr_accessible :name

  default_scope order("name ASC")

  has_many :expenses
end
