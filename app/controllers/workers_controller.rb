class WorkersController < ApplicationController

    def new
       @worker = Worker.new
       @user = User.find(params[:user_id])
    end

    def create
       @user = User.find(params[:user_id])
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


    def show
    end

    def update
        @worker = Worker.find_by_worker_user_name(params['worker_user_name']
        @worker.hashrate = params['hashrate']
        @worker.accepted = params['accepted']
        @worker.rejected = params['rejected']
        @worker.hw_errors = params['hw_errors']
        @worker.num_gpu = params['num_gpu']
        if @worker.save
            render status: 200
        else
            render status: 401
        end
    end


end
