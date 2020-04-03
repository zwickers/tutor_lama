class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :requester
      t.references :receiver
      t.references :number, index: true, foreign_key: true
      t.text :title
      t.text :text
      t.text :contact

      t.timestamps null: false
    end
  end
end
