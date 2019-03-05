module AdminHelper
    #def checked(area)
    #    @user.admin.nil? ? false : true 
        #@user.admin.nil? ? false : @user.admin.match(area)
   # end
    def boolean(boolean)
        @user.admin == true 
    end
    
end