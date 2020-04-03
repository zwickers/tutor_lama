class UsersController < ApplicationController

	# show users own profile
	def show_personal_profile
		unless session[:user_id]
			# if someone is not logged in and somehow
			# managed to get to personal profile page, redirect them to the log in page
			redirect_to root_url
		end
		@my_tutor_searches = TutorSearch.where(user_id: current_user.id)
		@my_tutee_searches = TuteeSearch.where(user_id: current_user.id)
		@sent_requests = current_user.sent_requests
		@received_requests = current_user.received_requests
	end

	# show profile of arbitrary user
	def show
		@arb_user = User.find(params[:id])
	end

	# get the form to edit a user's profile
	def edit
		
	end

	def update
		bio_text = params["bio"]["text"]
		User.update_bio(params["id"], bio_text)
		redirect_to "/users/me"
	end

end