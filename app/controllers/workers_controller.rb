class WorkersController < ApplicationController
    include SessionsHelper
    before_filter :signed_in_user, only: [:create, :destroy]
    def new
       @worker = Worker.new
       @user = User.find(params[:user_id])
    end

    def create
       @user = User.find(params[:user_id])
	   if !(current_user?(@user))
	     render 'home'
	   else
         @worker= Worker.new(params[:worker])
         @worker.user_id= @user.id
         @worker.worker_user_name = "#{@user.name.downcase}:#{@worker.name.downcase}"
         if @worker.save
           flash[:success] = "Worker information saved!"
           redirect_to @user
        else
           render 'new'
        end
	   end
    end

    def show
    end

    def update
        @worker = Worker.find_by_worker_user_name(params['worker_user_name'])
        if @worker != nil
           @worker.accepted = params['accepted']
           @worker.hashrate = params['hashrate']
           @worker.rejected = params['rejected']
           @worker.hw_errors = params['hw_errors']
           @worker.num_gpu = params['num_gpu']
        end
        if @worker.save
            render status: 200
        else
            render status: 401
        end
    end

    def destroy
        @worker.destroy
        redirect_to(current_user)
    end
end
