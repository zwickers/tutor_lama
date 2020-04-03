class Request < ActiveRecord::Base
  belongs_to :requester, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :number
  belongs_to :tutee_search
  belongs_to :tutor_search
end
