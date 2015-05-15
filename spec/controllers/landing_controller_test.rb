require "rails_helper"

describe LandingController do
  describe "GET #index" do
  it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #contact" do
  it "responds successfully with an HTTP 200 status code" do
      get :contact
      expect(response).to be_success
    end
  end

  describe "GET #about" do
    it "responds successfully with an HTTP 200 status code" do
      get :about
      expect(response).to be_success
    end
  end
end
