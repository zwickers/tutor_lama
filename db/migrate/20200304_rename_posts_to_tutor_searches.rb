class RenamePostsToTutorSearches < ActiveRecord::Migration
  def change
    rename_table :posts, :tutor_searches
  end
end