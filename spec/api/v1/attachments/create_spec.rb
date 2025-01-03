require 'rails_helper'

RSpec.describe "attachments#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/attachments", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'attachments',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(AttachmentResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Attachment.count }.by(1)
    end
  end
end
