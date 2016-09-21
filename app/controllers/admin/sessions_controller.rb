class Admin::SessionsController < Admin::BaseController
	skip_before_filter :check_sign_in, only: [:new , :create]

	def new
	end

	def create
		@user = User.where(email: params[:email]).first
		if @user && @user.authenticate(params[:password])
			session['user_id'] = @user.id
			redirect_to admin_root_path
		else
			render :new
		end
	end

	def destroy
		session['user_id'] = nil
		render :new 
	end
end
