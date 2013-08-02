class Team < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence =>true

  has_many :distance_essentials, :dependent => :destroy
  has_many :users, through: :team_invitations, :uniq => true
  has_many :team_invitations, :dependent => :destroy

  has_and_belongs_to_many :coaches, :class_name => 'User', :join_table => "coached_teams_coaches", :uniq => true
  
  attr_accessor :current_user

before_create :add_coach
private
  def add_coach
    if  !self.current_user.blank?
        self.coaches << self.current_user
    end
  end  

end
