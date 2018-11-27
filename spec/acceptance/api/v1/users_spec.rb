require 'rails_helper'
require "rspec_api_documentation"
require "rspec_api_documentation/dsl"

resource "Users" do
  header "Content-Type", "application/json"

  before(:all) do
    @company = create(:company_with_roles)
    @authenticated_user = create(:user)
    @users = create_list(:user, 5)
  end

  # get "/api/v1/users", document: :admin do
  #   context "200" do
  #     example "Get all users" do
  #       header "Authorization", authenticated_user.json_web_token

  #       do_request

  #       expected_response = {
  #         data: User.all
  #       }
  #       expect(status).to eq(200)
  #       expect(response_body).to eq(expected_response)
  #     end
  #   end

  #   context "404" do
  #     example "User unauthenticated" do
  #       do_request

  #       # binding.pry
  #       expect(status).to eq(404)
  #     end
  #   end
  # end

  post "/api/v1/users" do
    with_options scope: "data[user]", with_example: true do
      parameter :username, required: true
      parameter :primary_email, required: true
      parameter :secondary_email, required: false
      parameter :first_name, required: true
      parameter :last_name, required: true
      parameter :password, required: true
    end

    context "201" do
      example "Employee signup" do
        do_request({
          data: {
            user: attributes_for(:user).except!()
          }
        })

        body = JSON.parse(response_body)

        expect(status).to eq(201)
        expect(body["data"]['id']).to eq(User.last.id)
        expect(body["data"]['username']).to eq(User.last.username)
        expect(body["data"]['primary_email']).to eq(User.last.primary_email)
        expect(body["data"]['first_name']).to eq(User.last.first_name)
        expect(body["data"]['last_name']).to eq(User.last.last_name)
        expect(body["data"]['status']).to eq("active")
        expect(body["data"]['password']).to be_nil
      end
    end
  end
end
