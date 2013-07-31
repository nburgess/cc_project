class CreateTeamInvitations < ActiveRecord::Migration
  def change
    create_table :team_invitations do |t|
      t.references :user
      t.references :team

      t.timestamps
    end
    add_index :team_invitations, :user_id
    add_index :team_invitations, :team_id
  end
end
