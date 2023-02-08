class UserController < ApplicationController
  before_action :authorized, only: [:show]
  def find
    @user=User.find(params[:id])
    render json:@user
  end
    def new
        @user=User.new
        redirect_to:'create'
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
          @user.save
          redirect_to @user
        else  
          redirect 'new'
        end
      end

      def show
        @user = User.find(params[:id])
      end

      private
      def user_params
        params.require(:user).permit(:email, :password, :name, :phone)
  end
end
