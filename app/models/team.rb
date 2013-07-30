class Team < ActiveRecord::Base
  attr_accessible :name

  has_many :distance_essentials
  has_many :users, through: :distance_essentials, :uniq => true

  has_and_belongs_to_many :coaches, :class_name => 'User', :join_table => "coached_teams_coaches"

end
