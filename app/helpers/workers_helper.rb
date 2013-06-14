module WorkersHelper
    def find_worker_owner_by_ip(ip)
        @worker = Worker.find_by_ip_address(ip)
        @user = User.find(@worker.user_id)
    end
    
end
