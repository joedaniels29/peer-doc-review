require 'spec_helper'

describe UsersController do

  let(:valid_params) { {'user' => attributes_for(:user)} }
  describe 'when creating users' do
    context 'rejects invalid params' do
      after(:each) { expect(response.status).to eq(422) }

      it 'shouldn\'t allow nameless' do
        post 'create', "user" => attributes_for(:user, name: "")
      end

      it 'shouldn\'t allow duplicate emails' do
        duplicates_suck= "you@know.man"
        post 'create', "user" => attributes_for(:user, email: duplicates_suck)
        expect(response.status).to eq 201
        post 'create', "user" => attributes_for(:user, email: duplicates_suck)
      end

      it 'shouldn\'t allow mismatched passwords' do
        post 'create', "user" => attributes_for(:user, password_confirmation: '')
      end
    end

    context 'with valid params' do
      before(:each) { post 'create', valid_params }

      it 'returns an api key' do
        body = JSON.parse(response.body)
        user = User.find_by_email(valid_params["user"][:email])
        expect(body["auth_token"]).to_not be_nil
        expect(body["auth_token"]).to eq(user.auth_token)
      end

      after(:each) {
        expect(response.status).to eq(201)
        expect(response.content_type).to eql Mime::JSON.to_str
      }
    end
  end


  context 'once I exist,' do

    let!(:user) { User.create(valid_params["user"]) }

    it 'POST sign-in gives me my valid token' do
      user.to_json
      params = {
          email_or_username: valid_params["user"][:username],
          password: valid_params["user"][:password]
      }
      post 'sign_in', params
      body = JSON.parse(response.body)
      user = User.find_by_email(valid_params["user"][:email])
      expect(body["auth_token"]).to_not be_nil
      expect(body["auth_token"]).to eq(user.auth_token)
    end


    describe 'with valid token', validToken: true do
      before(:each) { authWithUser(user) }

      xit 'can upload a new Document'
      pending 'show my documents'
      pending 'show documents that can be reviewed'

      pending 'refuses to show reviews of my work until I first review the work of someone else.'

      context 'when reviewing someone else\'s work' do
        it 'allows me to download their word document'
        it 'allows me to upload my response'
      end

      context 'once I\'ve reviewed some work,' do
        pending 'shows reviews of my work with my first reviewing the work of someone else.'
      end

      pending 'can have its work reviewed after that.'
    end

    describe 'without a valid token', noToken: true do
      before(:each) { clearToken }
      after(:each) { expect(response.status).to eq(401) }

      xit 'GET #show is unauthorized' do
        post :show, id: 0
      end

      xit 'GET #index is unauthorized' do
        post :index
      end
    end
  end
end
