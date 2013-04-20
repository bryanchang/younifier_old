class SessionsController < ApplicationController

	def twitter
		# render :json => request.env['omniauth.auth'].to_json
		session[:twitter_token] = auth_hash['credentials']['token']
		session[:twitter_secret] = auth_hash['credentials']['secret']
		@username = auth_hash['info']['nickname']
		@name = auth_hash['info']['name']
		@location = auth_hash['info']['location']
		@img_url = auth_hash['info']['image']
		@description = auth_hash['info']['description']
	end

	# def facebook
	# 	#render :json => auth_hash.to_json
	# 	session[:facebook_token] = auth_hash['credentials']['token']
	# 	session[:facebook_secret] = auth_hash['credentials']['secret']
	# 	@username = auth_hash['info']['nickname']
	# 	@name = auth_hash['info']['name']
	# 	@location = auth_hash['info']['location']
	# 	@img_url = auth_hash['info']['image']
	# 	@description = auth_hash['info']['description'] 
	# 	token = auth_hash["credentials"]["token"]
	# 	@graph = Koala::Facebook::API.new(token)
	# 	@friends = @graph.get_connections("me", "friends")
	# end

	def create
		@user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = @user.id
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end


	private

	def auth_hash
		request.env['omniauth.auth']
	end

end