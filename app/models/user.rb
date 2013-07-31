class User < ActiveRecord::Base
  #extend FriendlyId
  #friendly_id :login
  #validates_format_of :login, :with => /\A[a-z0-9]+\z/i
  #friendly_id :user
  #validates_format_of :user, :with => /\A[a-z0-9]+\z/i

  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :role_ids

  has_many :distance_essentials
  has_many :teams, through: :team_invitations, :uniq => true
  has_and_belongs_to_many :coached_teams, :class_name => "Team", :join_table => "coached_teams_coaches", :uniq => true
  has_many :team_invitations


end
