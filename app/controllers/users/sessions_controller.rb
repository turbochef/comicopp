class Users::SessionsController < Devise::SessionsController
	before_action :set_user, only: [:subscribe, :unsubscribe]

	def subscribe
		current_user.follow!(@user)
		redirect_to root_path
	end

	def unsubscribe
		current_user.unfollow!(@user)
		redirect_to root_path
	end

	private

	def set_user
		@user = User.find(params[:user_id])
	end
end
