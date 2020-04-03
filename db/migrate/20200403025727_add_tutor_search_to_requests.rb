class AddTutorSearchToRequests < ActiveRecord::Migration
  def change
    add_reference :requests, :tutor_search, index: true, foreign_key: true
  end
end
