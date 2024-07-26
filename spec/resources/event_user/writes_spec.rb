require 'rails_helper'

RSpec.describe EventUserResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'event_users',
          attributes: { }
        }
      }
    end

    let(:instance) do
      EventUserResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { EventUser.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:event_user) { create(:event_user) }

    let(:payload) do
      {
        data: {
          id: event_user.id.to_s,
          type: 'event_users',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      EventUserResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { event_user.reload.updated_at }
      # .and change { event_user.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:event_user) { create(:event_user) }

    let(:instance) do
      EventUserResource.find(id: event_user.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { EventUser.count }.by(-1)
    end
  end
end
