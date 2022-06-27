module Api
	module V1
		class InfoController < ApplicationController
			def index
				render json: {"info":"Hello, World!"}
			end
		end
	end
end