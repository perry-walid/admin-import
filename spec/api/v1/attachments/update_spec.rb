require 'rails_helper'

RSpec.describe "attachments#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/attachments/#{attachment.id}", payload
  end

  describe 'basic update' do
    let!(:attachment) { create(:attachment) }

    let(:payload) do
      {
        data: {
          id: attachment.id.to_s,
          type: 'attachments',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(AttachmentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { attachment.reload.attributes }
    end
  end
end
