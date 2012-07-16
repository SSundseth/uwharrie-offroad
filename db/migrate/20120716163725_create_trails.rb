class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :name
      t.string :length
      t.string :difficulty

      t.timestamps
    end
  end
end
