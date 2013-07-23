class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true
  
  scopify

  ROLE_ADMIN = "admin"
  ROLE_COACH = "coach"
  ROLE_PLAYER = "player"

  def self.all_but_admin
    where("name <> ?", ROLE_ADMIN)
  end
end
