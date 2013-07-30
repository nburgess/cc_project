class CreateCoachedTeamsCoachesJoinTable < ActiveRecord::Migration
  def up
    create_table :coached_teams_coaches, :id => false do |t|
        t.references :team
        t.references :user
    end
    add_index :coached_teams_coaches, [:team_id, :user_id]
    add_index :coached_teams_coaches, :user_id
  end

  def down
    drop_table :coached_teams_coaches
  end
end
