class Admin::UsersController < ApplicationController
  def index
   @users=User.all
  end

  def show
    # fail
    @user=User.find(params[:id])
  end
  
end
