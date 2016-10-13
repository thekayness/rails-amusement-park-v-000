class SessionsController < ApplicationController
 	
  	def create
      puts"in create"
    user = User.find_by_name(params[:user][:name])
    # puts "user found #{user.name}"
    puts "found user #{user}"
     # puts "are params even #{params}"
    # If the user exists AND the password entered is correct.
    # puts "password params #{params[:user][:password]}"
    # puts "authenticated #{user.authenticate(params[:user][:password])}"
    if user && user.authenticate(params[:user][:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      # puts "wat"
      redirect_to user_path(user)
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/'
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end
end
