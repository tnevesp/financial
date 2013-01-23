# encoding: UTF-8
class Store < ActiveRecord::Base
  attr_accessible :name, :store_type_id

  #default_scope order("name ASC")

  has_many :expenses
  belongs_to :store_type

  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
  validates :store_type, :presence => true

  delegate :name, :to => :store_type, :prefix => true

end