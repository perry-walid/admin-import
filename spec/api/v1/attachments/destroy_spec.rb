require 'rails_helper'

RSpec.describe "attachments#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/attachments/#{attachment.id}"
  end

  describe 'basic destroy' do
    let!(:attachment) { create(:attachment) }

    it 'updates the resource' do
      expect(AttachmentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Attachment.count }.by(-1)
      expect { attachment.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
