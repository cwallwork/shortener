class CreateUrlUsers < ActiveRecord::Migration
  def change
    create_table :url_users do |t|
      t.references :user
      t.references :url

      t.timestamps
    end
  end
end
