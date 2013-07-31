class DistanceEssential < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
      
   attr_accessible :core_strength, :date, :diet_quality, :hours_of_sleep, :minutes_cross_training, :minutes_icing, :minutes_run, :minutes_streching, :upper_body_weights, :team_id
  
  attr_accessor :current_user

  validate :cannot_add_when_uninvited


  def cannot_add_when_uninvited
    if !self.current_user.teams.include?(self.team)
      errors[:base] << "adding to a team when un-invited prohibited"
    end
  end

before_create :add_user
private
   def add_user
      if  !self.current_user.blank?
        self.user = self.current_user
      end
   end
end
