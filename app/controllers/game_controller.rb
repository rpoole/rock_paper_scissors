class GameController < ApplicationController
	SIGN_CHOICES = %w[rock paper scissors]

	def index
		@signs = SIGN_CHOICES
	end

	def throw
		if params[:sign] && SIGN_CHOICES.include?(params[:sign])
			@user_throw = params[:sign]
			@server_throw = SIGN_CHOICES.sample
			@result = compare(@user_throw, @server_throw)
		else
			Rails.logger.debug "Invalid sign choice passed: #{params[:sign]}"
			render :file => 'public/500.html', :status => 500
		end
	end

	private

	def compare(user_throw, server_throw)
		return 'tie' if @user_throw == @server_throw

		if @user_throw == 'rock'
			@server_throw == 'paper' ? (return 'lose') : (return 'win')
		elsif @user_throw == 'paper'
			@server_throw == 'scissors' ? (return 'lose') : (return 'win')
		elsif @user_throw == 'scissors'
			@server_throw == 'rock' ? (return 'lose') : (return 'win')
		end
	end
end
