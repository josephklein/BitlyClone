class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :full_url
      t.string :url_code
      
      t.timestamps
    end
  end
end
