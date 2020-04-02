class Number < ActiveRecord::Base
  belongs_to :subject
  has_many :tutor_searches
  has_many :tutee_searches
end
