class WorkersController < ApplicationController

    def new
       @worker = Worker.new
       @user = User.find(params[:user_id])
    end

    def create
       @user = User.find(params[:user_id])
       @worker= Worker.new(params[:worker])
       @worker.user_id= @user.id
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
        @user = User.find(params[:user_id])
        @worker = Worker.find(params[:id])
        @MHS = params[:SUMMARY][:MHS_av]
        @worker.hashrate = @MHS
        @worker.save
    end


end
