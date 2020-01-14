# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "RegistrationsController" do
  describe "/registrations" do
    let(:valid_params) do 
      { user: {
                first_name: "test", 
                last_name:"user",   
                email: "test@email.com", 
                password: "test1234", 
                password_confirmation: "test1234", 
                country_name: "Kenya",
                city: "Kisumu",
                region: "Africa/Nairobi",
                country_code: "254",
                timezone_offset: "+3"}
              } 

    end
    let(:invalid_params) do 
      { user: {
                first_name: "test", 
                last_name:"user",   
                email: "", 
                password: nil, 
                password_confirmation: "test1234", 
                country_name: "Kenya",
                city: "Kisumu",
                region: "Africa/Nairobi",
                country_code: "254",
                timezone_offset: "+3"}
              } 

    end
    let(:endpoint) { "/signup"}
    
    it "creates a user with valid params" do
      expect{post endpoint, params: valid_params}.to change(User, :count).by(1)
    end

    it "responds with error with invalid params" do
      post endpoint, params: invalid_params
      json_response = response.parsed_body
      expect(json_response["errors"][0]["detail"].keys).to match_array(["email", "password", "password_confirmation"])
    end
  end
end