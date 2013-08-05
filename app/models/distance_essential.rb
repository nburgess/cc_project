class DistanceEssential < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
      
   attr_accessible :core_strength, :date, :diet_quality, :hours_of_sleep, :minutes_cross_training, :minutes_icing, :minutes_run, :minutes_streching, :upper_body_weights, :team_id
  
  attr_accessor :current_user

  validate :cannot_add_when_uninvited

  before_create :add_user

  def cannot_add_when_uninvited
    if !self.current_user.teams.include?(self.team)
      errors[:base] << "adding to a team when un-invited prohibited"
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << %w[id player_name team_name date diet_quality hours_of_sleep minutes_run minutes_stretching minutes_icing core_strength upper_body_weights minutes_cross_training]

      all.each do |essentials|
        row = []
        row << essentials.id
        row << essentials.user.name
        row << essentials.team.name
        row << essentials.date
        row << essentials.diet_quality
        row << essentials.hours_of_sleep
        row << essentials.minutes_run
        row << essentials.minutes_streching
        row << essentials.minutes_icing
        row << essentials.core_strength
        row << essentials.upper_body_weights
        row << essentials.minutes_cross_training


        csv << row
      end
    end
  end

private
   def add_user
      if  !self.current_user.blank?
        self.user = self.current_user
      end
   end
end
