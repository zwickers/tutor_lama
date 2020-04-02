class AddNumberBelongsToToTuteeSearches < ActiveRecord::Migration
  def change
    add_belongs_to :tutee_searches, :number, index: true, foreign_key: true
  end
end
