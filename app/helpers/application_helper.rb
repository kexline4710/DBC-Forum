module ApplicationHelper

	def current_user
    if User.exists?(session[:user_id])
		  return User.find(session[:user_id])
    end
    
    return false
	end

end
