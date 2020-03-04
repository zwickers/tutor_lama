class WelcomeController < ApplicationController
	def show
#<<<<<<< HEAD
		if current_user
			@tutor_searches = TutorSearch.all
			@tutee_searches = TuteeSearch.all
#=======
		# user shouldn't be looking at the log in page
		# when they are already signed in
#		if session[:user_id]
#			# TODO: change this redirect to the
			# Posts page, once that MVC is added
		#			redirect_to "/users/me"
#>>>>>>> b61d3cfb138319c46468e72050b0465f14419646
		end
	end
end