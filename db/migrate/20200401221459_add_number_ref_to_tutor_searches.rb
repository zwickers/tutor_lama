class AddNumberRefToTutorSearches < ActiveRecord::Migration
  def change
    add_belongs_to :tutor_searches, :number, index: true, foreign_key: true
  end
end
