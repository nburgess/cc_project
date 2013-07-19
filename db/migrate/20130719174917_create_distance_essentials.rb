class CreateDistanceEssentials < ActiveRecord::Migration
  def change
    create_table :distance_essentials do |t|
      t.references :user
      t.references :team
      t.date :date
      t.integer :diet_quality
      t.integer :hours_of_sleep
      t.integer :minutes_run
      t.integer :minutes_streching
      t.integer :minutes_icing
      t.integer :core_strength
      t.integer :upper_body_weights
      t.integer :minutes_cross_training

      t.timestamps
    end
    add_index :distance_essentials, :user_id
    add_index :distance_essentials, :team_id
  end
end
