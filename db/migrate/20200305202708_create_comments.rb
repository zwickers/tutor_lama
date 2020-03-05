class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.datetime :time
      t.integer :tutor_search_id
      t.integer :tutee_search_id

      t.timestamps null: false
    end
  end
end
