class StoreType < ActiveRecord::Base
  attr_accessible :name

  default_scope order("name ASC")

  has_many :stores

  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
end
