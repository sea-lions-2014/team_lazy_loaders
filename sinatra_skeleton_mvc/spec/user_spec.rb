require 'spec_helper'

describe User do

  describe "user creation" do 
    before :all do
      @user = User.new(username:'bob')
      @user.password = 'bob'
      @user.save
    end

    after :all do
      @user.destroy
    end

    it "should have a username" do
      @user.username.should == 'bob'
    end

    it "should have a password in the database" do
      @user.password_hash.should_not == nil
    end

    it "should not have its password stored as plain text" do
      @user.password_hash.should_not == @user.password
    end

    it "should have a unique username" do
      bob2 = User.new(username:'bob')
      bob2.valid?.should_not == true
    end
  end
end
