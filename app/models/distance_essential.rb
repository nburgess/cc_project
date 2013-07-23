class DistanceEssential < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
      
     	attr_accessible :core_strength, :date, :diet_quality, :hours_of_sleep, :minutes_cross_training, :minutes_icing, :minutes_run, :minutes_streching, :upper_body_weights, :team_id
attr_accessor :current_user

before_create :add_user
private
   def add_user
      if  !self.current_user.blank?
        self.user = self.current_user
      end
   end
end
