class AddTuteeSearchToRequests < ActiveRecord::Migration
  def change
    add_reference :requests, :tutee_search, index: true, foreign_key: true
  end
end
