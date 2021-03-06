class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.string :image
      t.string :bio
      t.datetime :oauth_expires_at
      t.timestamps null: false
    end
  end
end
