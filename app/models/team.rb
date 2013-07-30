class Team < ActiveRecord::Base
  attr_accessible :name

  has_many :distance_essentials
  has_many :users, through: :distance_essentials

end
