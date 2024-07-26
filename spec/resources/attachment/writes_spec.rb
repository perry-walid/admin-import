require 'rails_helper'

RSpec.describe AttachmentResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'attachments',
          attributes: { }
        }
      }
    end

    let(:instance) do
      AttachmentResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Attachment.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:attachment) { create(:attachment) }

    let(:payload) do
      {
        data: {
          id: attachment.id.to_s,
          type: 'attachments',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      AttachmentResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { attachment.reload.updated_at }
      # .and change { attachment.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:attachment) { create(:attachment) }

    let(:instance) do
      AttachmentResource.find(id: attachment.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Attachment.count }.by(-1)
    end
  end
end
