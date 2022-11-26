class WelcomeController < ApplicationController
	def index
		print(session.to_hash)
		@id = session[:user_id]
		print(@id)
	end
end
