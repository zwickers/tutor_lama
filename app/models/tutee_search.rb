class TuteeSearch < ActiveRecord::Base
  belongs_to :user
  belongs_to :number
  has_many :comments, class_name: "Comment", foreign_key: "tutee_search_id"
end