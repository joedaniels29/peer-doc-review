require 'spec_helper'

describe Document do




  let(:document_params) { FactoryGirl.attributes_for(:document, author_id:create(:user).id) }

  it 'can be created' do
    document= Document.create! document_params
    expect(document.new_record?)

  end


  context 'once created' do
    subject(:document) { create(:document) }

    it 'has an author' do
      expect(document.author).to_not be_nil
    end



  end
  context 'with a few of mine' do
    before(:each) do
      create(:user, number_of_docs: 10)

    end


  end

end
