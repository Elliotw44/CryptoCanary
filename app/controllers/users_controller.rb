class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user, only: [:edit, :update]

    def show
        @user = User.find(params[:id])
        if @user != current_user
            redirect_to(current_user)
        end
        @workerArray = @user.workers
        @workerArray.each do |work|
            if((DateTime.now.to_time - work.updated_at.to_time) < (14 * 60) and work.online) #14 minutes
            else
                work.online = false
            end
        end
    end 

    def new
        @user = User.new
    end

    def create
        @user= User.new(params[:user])
        @user.name.strip!
        if @user.save
            sign_in(@user)
            flash[:success] = "Welcome to the mining monitor website!"
            redirect_to @user
        else
            render 'new'
        end
    end

    def edit
        @user = User.find(params[:id])
    end
       

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(params[:user])
            flash[:success] = "Information updated"
            sign_in(@user)
            redirect_to(@user)
        else
            render 'edit'
        end
    end

    private
    def signed_in_user
        redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_path) unless current_user?(@user)
    end
end
