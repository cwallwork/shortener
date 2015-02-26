class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :full_url
      t.string :converted_url
      t.integer :view_count
      t.timestamps
    end
  end
end
