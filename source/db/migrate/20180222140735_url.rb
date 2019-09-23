class Url < ActiveRecord::Migration
  def change
    change_table :urls do |t|
      t.integer :click_count, :default => 0, :null => false
    end
  end
end
