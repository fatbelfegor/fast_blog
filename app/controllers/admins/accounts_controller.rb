module Admins
  class AccountsController < ApplicationController

  	def edit
  	end

  	def update_info
      if current_admin.update(admin_info_params)
        flash[:success] = 'Successfully saved info.'
      else
        flash[:danger] = current_admin.display_error_messages
      end
      redirect_to admins_account_path
    end

    def change_password
      admin = current_admin
      if admin.valid_password?(admin_password_params[:current_password])
        if admin.change_password(admin_password_params)
          sign_in(admin, bypass: true)
          flash[:success] = 'Successfully changed password.'
        else
          flash[:danger] = admin.display_error_messages
        end
      else
        flash[:danger] = 'Current password was incorrect.'
      end
      redirect_to admins_account_path
    end

    private

    def admin_info_params
      params.require(:admin).permit(:username, :email)
    end

    def admin_password_params
      params.require(:admin).permit(:current_password, :new_password, :new_password_confirmation)
    end


  end
end
