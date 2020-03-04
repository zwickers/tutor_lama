class WelcomeController < ApplicationController

	def show
		# user shouldn't be looking at the log in page
		# when they are already signed in
		if session[:user_id]
			# TODO: change this redirect to the
			# Posts page, once that MVC is added
			redirect_to "/users/me"
		end
	end

end