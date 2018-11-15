class Api::V1::UsersController < ApplicationController
  before_action :authorize!

  def index
    if authorized?
      render status: 200, json: User.all
    else
      four_oh_four
    end
  end

  def create
    if current_user
      # Organization coordinator or admin is creating a new user
      @user = User.new(user_params.merge(password: "password"))
      if !@user.valid?
        render status: 400, json: { message: @user.errors.full_messages }
      elsif options[:role_name] === "employee" && !@user.employee_email?
        render status: 400, json: { message: "Not a company email" }
      else
        begin
          @user.roles << Role.find_by(name: options[:role_name], roleable: Organization.find(options))
          if @user.save
            # send mailer with confirmation link and prompt to update password
            # e.g. /confirm/:token?set-password=true
            render status: 201, json: @user.response_attributes
          else
            render status: 500, json: { message: "Unable to save user" }
          end
        rescue ActiveRecord::StatementInvalid, ActiveRecord::RecordNotFound
          render status: 400, json: { message: "Role options invalid" }
        rescue StandardError => msg
          render status: 500, json: { message: msg }
        end
      end
    else
      # Employee is signing up with company email address
      @user = User.new(user_params)
      if !@user.valid?
        render status: 400, json: { message: @user.errors.full_messages }
      elsif !@user.employee_email?
        render status: 400, json: { message: "Not a company email" }
      else
        @user.roles << Role.find_by(name: :employee, roleable: Company.find_by(email_domain: @user.email_domain))
        if @user.save
          # send mailer with confirmation link
          render status: 201, json: @user.response_attributes
        else
          render status: 500, json: { message: "Unable to save user" }
        end
      end
    end
  end

  def options
    params.require(:options).permit(:company_id, :partner_id, :role_name)
  end

  def user_params
    params.require(:user).permit(:username, :primary_email, :password, :first_name, :last_name)
  end
end
