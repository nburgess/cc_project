class TeamInvitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  
  attr_accessor :email
  attr_accessible :team_id, :email
  before_create :associate_user
  private
  def associate_user
    user = User.where(:email => self.email).first
    if user.blank?
      # Create new user if it doesn't exist.
      new_user = User.new(:email => self.email, :password => Devise.friendly_token[0,20])
      new_user.skip_confirmation!
      new_user.save!
     
      # Associate the newly created user with the invitation
      self.user = new_user
    else
      self.user = user
    end
  end
end
