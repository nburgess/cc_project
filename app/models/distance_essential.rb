class DistanceEssential < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  attr_accessible :core_strength, :date, :diet_quality, :hours_of_sleep, :minutes_cross_training, :minutes_icing, :minutes_run, :minutes_streching, :upper_body_weights, :team_id
end
