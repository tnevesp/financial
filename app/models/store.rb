# encoding: UTF-8
class Store < ActiveRecord::Base
  attr_accessible :name

  default_scope order("name ASC")

  has_many :expenses

  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
end
