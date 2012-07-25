class AddInfoToTrails < ActiveRecord::Migration
  def change
    add_column :trails, :info, :text
  end
end
