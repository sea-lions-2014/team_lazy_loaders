require 'spec_helper'

describe 'User Controller' do

  it 'should render the index page' do
    get "/"
    expect(last_response).to be_ok
  end

  it 'should allow a user to create a new user' do
    post '/users'
    expect(last_response.status).to eq(302)
  end

  describe "user login and authentication" do

    before :all do
      @user = User.new(username:'bob')
      @user.password='bob'
      @user.save
    end

    after :all do
      User.destroy_all
    end

    it 'should allow a user to sign in' do
      post '/sessions'
      expect(last_response.status).to eq(302)
    end

    it 'should authenticate a valid user during signin' do
      current_params = {username: 'bob', password: 'bob'}
      post '/sessions', current_params
      expect(last_request.env['rack.session']['id']).to eq(@user.id)
    end

    it 'should reject someone trying to login with the wrong password!' do
      current_params = {username: 'bob', password: 'notbob'}
      post '/session', current_params
      expect(last_request.env['rack.session']['id']).to eq(nil)
    end
  end

  describe 'user logout' do
    before :all do
      @user = User.new(username:'bob')
      @user.password='bob'
      @user.save
    end

    after :all do
      User.destroy_all
    end

    it 'display the index page when a user logs out' do
      delete '/sessions'
      expect(last_response).to be_ok
    end

    it 'logs a user out when they sign out' do
      delete '/sessions'
      expect(last_request.env['rack.session']['id']).to eq(nil)
    end
  end
end



# was the web request successful?
# was the user redirected to the right page?
# was the user successfully authenticated?
# was the correct object stored in the response template?
# was the appropriate message displayed to the user in the view?