class Comment < ActiveRecord::Base
	belongs_to :tutor_search, class_name: "TutorSearch", foreign_key: "tutor_search_id"
  	belongs_to :tutee_search, class_name: "TuteeSearch", foreign_key: "tutee_search_id"
end
