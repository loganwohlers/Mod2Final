class ApplicationController < ActionController::Base
 helper_method :logged_in?
 helper_method :can_spend?
 before_action :authenticate_user


 def current_user
   User.find_by(id: session[:user_id])
 end

 def logged_in?
   !!session[:user_id]
 end

 def authenticate_user
   if !logged_in?
     redirect_to login_path
   end
 end

 def set_votes
   session[:skill_points] ||= 50
 end

 def can_spend?
   session[:skill_points] > 0
 end

 def vote_count
   session[:skill_points].to_i
 end

 def decrement_votes
  session[:skill_points] = vote_count - 1
 end

end
