require 'spec_helper'

describe DocumentsController do
  let(:user) { create(:user) }
  let(:document_attributes) { attributes_for(:document) }
  before(:each) { expect(subject).to receive(:authenticate).once }

  describe 'with valid token', validToken: true do
    before(:each) { authWithUser(user) }

    describe 'when creating documents' do
      context 'rejects invalid params' do
        after(:each) { expect(response.status).to eq(422) }

        it 'shouldn\'t allow nameless' do
          post 'create', "document" => attributes_for(:document_with_text_content, author_id: user.id, name: '')
        end

        it 'shouldn\'t allow files and content together' do
          post 'create', "document" => attributes_for(:document_with_file, author_id: user.id, content: Lorem::Base.new(:paragraphs, 10).output)
        end
      end

      context 'with valid params' do
        # before(:each) {  }
        let(:valid_document_params) { attributes_for(:document_with_file, author_id: user.id) }

        it 'returns valid' do
          post 'create', {document: valid_document_params}
        end

        it{ expect { post 'create', {document: valid_document_params} }.to change { Document.count }.by(1) }

        after(:each) {
          expect(response.status).to eq(201)
          expect(response.content_type).to eql Mime::JSON.to_str
        }
      end
    end

    describe 'when I\'ve got docuemnts' do

      xit 'returns my documents'

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
  end
  describe 'without a valid token', noToken: true do
    before(:each) { clearToken }
    after(:each) { expect(response.status).to eq(401) }
    context 'with valid (any) params' do
      let(:valid_document_params) { attributes_for(:document_with_text_content, author_id: user.id) }

      it 'doesnt return valid' do
        post 'create', valid_document_params
      end

    end

  end
end