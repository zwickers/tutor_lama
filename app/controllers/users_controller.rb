class UsersController < ApplicationController

	# show users own profile
	def show_personal_profile
		if not session[:user_id]
			# if someone is not logged in and somehow
			# managed to get to personal profile page, redirect them to the log in page
			redirect_to root_url
		end
	end

	# show profile of arbitrary user
	def show 

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