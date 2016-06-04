class UsersController < ApplicationController
  
  def index
    @users = User.sorted 
  end
  
  def new 
    @user = User.new()
  end
  
  def create
    #Instantiate a new object using form parameters
    @user = User.new(user_params)
    # Save the object 
    if @user.save
    # If save succeeds, redirect to the index action 
    flash[:notice] = "Thanks for joining!"
    redirect_to(:controller => 'landing', :action => 'index')
    else
    # If save fails, redisplay the form so user can fix problems
    flash[:error] = "Please correct the information below."
    render('new')
    end
  end
 
  
  def delete
    @user = User.find(params[:id])
  end
  
  def destroy  
    user = User.find(params[:id]).destroy
    flash[:notice] = " User destroyed successfully"
    redirect_to(:action => 'index')
  end

  #private means this can't be called as an action
  private 
    def user_params
      # same as using "params[:subject]", except that it: 
      # - raises an error if :suject is not present 
      # - allows listed attributes to be mass-assigned
      params.require(:user).permit(:first, :last, :email)
    end 

  
end
