class Users::SessionsController < Devise::SessionsController
	before_action :set_user, only: [:subscribe, :unsubscribe]

	def subscribe
		current_user.follow!(@user)
	end

	def unsubscribe
		current_user.unfollow!(@user)
	end

	private

	def set_user
		@user = User.find(params[:user_id])
	end
end
