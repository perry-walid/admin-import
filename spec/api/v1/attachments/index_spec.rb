require 'rails_helper'

RSpec.describe "attachments#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/attachments", params: params
  end

  describe 'basic fetch' do
    let!(:attachment1) { create(:attachment) }
    let!(:attachment2) { create(:attachment) }

    it 'works' do
      expect(AttachmentResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['attachments'])
      expect(d.map(&:id)).to match_array([attachment1.id, attachment2.id])
    end
  end
end
