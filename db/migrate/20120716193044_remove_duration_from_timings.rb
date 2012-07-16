class RemoveDurationFromTimings < ActiveRecord::Migration
  def up
    remove_column :timings, :duration
    add_column :timings, :seconds, :integer
  end

  def down
  end
end
