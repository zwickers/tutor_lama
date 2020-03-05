class TutorSearch < ActiveRecord::Base
  belongs_to :user
  has_many :comments, class_name: "Comment", foreign_key: "tutor_search_id"
end
