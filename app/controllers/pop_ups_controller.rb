class PopUpsController < ApplicationController

	def pop_up
		@text =   params[:text]
		@target = params[:target]
		@method = params[:method]
		
		respond_to do |format|
			format.js
		end
	end

end
