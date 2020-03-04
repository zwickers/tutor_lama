class WelcomeController < ApplicationController
	def show
		if current_user
			@tutor_searches = TutorSearch.all
			@tutee_searches = TuteeSearch.all
		end
	end
end