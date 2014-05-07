require 'spec_helper'

describe User do


  let(:user_params) {
    FactoryGirl.attributes_for(:user)
  }

  it 'can be created' do
    user = User.create! user_params
    expect(user.new_record?)
  end


  context 'once created' do
    subject(:user) {create(:user)}

    it ' has an api key' do
      user = User.create! user_params
      expect(user.auth_token).to_not be_nil

    end

    it 'can have a document'

    context 'with a document' do
      it 'can have a review'

      context 'with a review' do

      end
    end
  end
end