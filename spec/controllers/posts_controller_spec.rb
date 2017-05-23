require 'rails_helper'

describe Blog::PostsController do
  describe "GET index" do
  	it "returns ok and a 200 for successful request" do
  		get :index
  		expect(response.status).to  eq(200)
  	end
 	end
end