class CreateNumbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
      t.belongs_to :subject, index: true, foreign_key: true
      t.string :name


      t.timestamps null: false
    end
  end
end
