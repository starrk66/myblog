class Admin::UsersController < Admin::BaseController
	skip_before_filter :check_sign_in, only: [:new , :create]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session['user_id'] =@user.id
			redirect_to admin_root_path
		else
			render :new
		end
	end

	private

	def user_params
		params.permit(:email, :nickname, :password, :password_confirmation)
	end
end
