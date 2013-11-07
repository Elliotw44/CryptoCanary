module WorkersHelper
	def total_worker_stats(user_id)
	   @workers = Worker.find_by_user_id(user_id)
	   @workers.each do |worker|  
	      @total_hashrate += worker.hash_rate  
	      @total_accpeted += worker.accepted  
		  @total_rejected += worker.rejected  
	      @total_hw_errors += worker.hw_errors  
		  @total_gpunum += worker.num_gpu  
		end
	    @compiledstats = { hashrate: @total_hashrate, accepted: @total_accepted, rejected: @total_rejected, hw_errors: @total_hw_errors, numgpu: @total_gpunum }
	end

	def worker_stats(worker_id)
	   @worker = Worker.find_by_id(worker_id)
	end
    
end
