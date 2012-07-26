class CreateTimings < ActiveRecord::Migration
  def change
    create_table :timings do |t|
      t.integer :user_id
      t.integer :trail_id
      t.time :duration

      t.timestamps
    end
  end
end
