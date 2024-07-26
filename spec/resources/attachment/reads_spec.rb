require 'rails_helper'

RSpec.describe AttachmentResource, type: :resource do
  describe 'serialization' do
    let!(:attachment) { create(:attachment) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(attachment.id)
      expect(data.jsonapi_type).to eq('attachments')
    end
  end

  describe 'filtering' do
    let!(:attachment1) { create(:attachment) }
    let!(:attachment2) { create(:attachment) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: attachment2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([attachment2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:attachment1) { create(:attachment) }
      let!(:attachment2) { create(:attachment) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            attachment1.id,
            attachment2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            attachment2.id,
            attachment1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
