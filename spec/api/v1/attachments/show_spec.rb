require 'rails_helper'

RSpec.describe "attachments#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/attachments/#{attachment.id}", params: params
  end

  describe 'basic fetch' do
    let!(:attachment) { create(:attachment) }

    it 'works' do
      expect(AttachmentResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('attachments')
      expect(d.id).to eq(attachment.id)
    end
  end
end
