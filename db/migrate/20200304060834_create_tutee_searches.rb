class CreateTuteeSearches < ActiveRecord::Migration
  def change
    create_table :tutee_searches do |t|
      t.string :title
      t.text :text
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
