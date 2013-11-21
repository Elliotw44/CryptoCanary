class WorkersController < ApplicationController
    include SessionsHelper
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
         @worker.num_gpu = 0
         @worker.hashrate = 0
         @worker.online = false
         @worker.worker_user_name = "#{@user.id}:#{@worker.name.downcase}"
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
        @worker = Worker.find_by_worker_user_name(params['wun'])
        if @worker != nil
           @worker.accepted = params['a']
           @total_HR = 0
           @worker.rejected = params['r']
           @worker.hw_errors = params['he']
           @gpuarray = params['gs']
           @worker.num_gpu = (@gpuarray.length/2)
           if @worker.num_gpu >= 1
               @worker.GPUT1 = @gpuarray[0]
               @worker.GPUH1 = @gpuarray[1] * 1000
               @total_HR += @gpuarray[1]
               if @worker.num_gpu >= 2
                   @worker.GPUT2 = @gpuarray[2]
                   @worker.GPUH2 = @gpuarray[3] * 1000
                   @total_HR += @gpuarray[3]
                   if @worker.num_gpu >= 3 
                       @worker.GPUT3 = @gpuarray[4]
                       @worker.GPUH3 = @gpuarray[5] * 1000
                       @total_HR += @gpuarray[5]
                      if @worker.num_gpu >= 4  
                          @worker.GPUT4 = @gpuarray[6]
                          @worker.GPUH4 = @gpuarray[7] * 1000
                          @total_HR += gpuarray[7]
                      end
                   end
               end
           end
           @worker.hashrate = @total_HR * 1000
           if(@worker.hashrate != 0)
               @worker.online = true
           else
              @worker.online = false
           end

           if @worker.save
               render status: 200
           else
              render status: 400
           end

        else
           render status: 500
        end
    end

    def destroy
        @worker = Worker.find_by_id(params[:id])
        @user = @worker.user
        @worker.destroy
        redirect_to @user
    end
end             
