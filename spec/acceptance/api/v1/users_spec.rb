require 'rails_helper'
require "rspec_api_documentation"
require "rspec_api_documentation/dsl"

resource "Users" do
  before(:all) do
    @authenticated_user = create(:user)
    @users = create_list(:user, 5)
  end

  get "/api/v1/users", document: :admin do
    context "200" do
      example "Get all users" do
        header "Authorization", authenticated_user.json_web_token

        do_request

        expected_response = {
          data: User.all
        }
        expect(status).to eq(200)
        expect(response_body).to eq(expected_response)
      end
    end

    context "404" do
      example "User unauthenticated" do
        do_request

        # binding.pry
        expect(status).to eq(404)
      end
    end
  end
end
