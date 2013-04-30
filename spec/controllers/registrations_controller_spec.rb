require 'spec_helper'

describe RegistrationsController do

  before :each do
    @member = FactoryGirl.create(:member)
    sign_in @member
    controller.stub(:current_user) { @member }
    controller.stub(:devise_mapping).and_return(Devise.mappings[:member])
  end

  describe "GET edit" do
    it "assigns the requested member as @member" do
      get :edit
      assigns(:member).should eq(@member)
    end

    it "picks up the twitter auth" do
      @auth = FactoryGirl.create(:authentication, :member => @member)
      get :edit
      assigns(:twitter_auth).should eq @auth
    end
  end

end