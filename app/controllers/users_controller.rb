class UsersController < ApplicationController
	before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
	before_filter :correct_user, :only => [:edit, :update]
	before_filter :admin_user, :only => :destroy
	
	def index
		@title = "All Users"
		@users = User.paginate(:page => params[:page])
	end
	
	def show
		@user = User.find(params[:id])
		@listings = @user.listings.paginate(:page => params[:page])
		@title = @user.name
	end

  def new
	  @user = User.new
  	if current_user?(@user)
  		redirect_to root_path
  	else
  		@title = "Sign Up"
  	end
  end
  
  def create
	  @user = User.new(params[:user])
  	if current_user?(@user)
  		redirect_to root_path
  	else
  		if @user.save
  			sign_in @user
  			flash[:success] = "Welcome to Black Market Books!"
  			redirect_to @user
  		else
  			@title = "Sign Up"
  			render 'new'
  		end
  	end
  end
  
  def edit
  	@title = "Edit user"
  end
  
  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(params[:user])
  		flash[:success] = "Profile updated."
  		redirect_to @user
  	else
  		@title = "Edit User"
  		render 'edit'
  	end
  end
  
  def destroy
  	User.find(params[:id]).destroy
  	flash[:success] = "User destroyed."
  	redirect_to users_path
  end
  
  private
  	
  	def correct_user
  		@user = User.find(params[:id])
  		redirect_to(root_path) unless current_user?(@user)
  	end
  	
  	def admin_user
  		redirect_to(root_path) unless current_user.admin?
  	end
end
