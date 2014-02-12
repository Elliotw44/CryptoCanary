class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

    def show
        @user = User.find(params[:id])
        if @user != current_user
            redirect_to(current_user)
        end
        @workerArray = @user.workers
        @workerArray.each do |work|
            if((DateTime.now.to_time - work.updated_at.to_time) < (6.25 * 60) and work.online) #6.25 minutes
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
        if(verify_recaptcha(model: @user, private_key: ENV['RECAPTCHA_PRIVATE_KEY'], timeout: 10) && @user.save)
              sign_in(@user)
              flash[:success] = "Welcome to Miners Canary"
              redirect_to @user
        else
              flash.delete(:recaptcha_error)
              @user.errors.add(:base, I18n.t(:wrong_captcha))
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
            redirect_to(@user)
        else
            render 'edit'
        end
    end

    private
    def signed_in_user
        unless signed_in?
            store_location
            redirect_to signin_url, notice: "Please Sign in."
        end
    end

    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_path) unless current_user?(@user)
    end
end
