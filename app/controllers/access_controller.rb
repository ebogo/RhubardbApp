class AccessController < ApplicationController
  def login
    @user = User.new
  end
  
end
