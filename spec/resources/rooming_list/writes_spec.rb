require 'rails_helper'

RSpec.describe RoomingListResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'rooming_lists',
          attributes: { }
        }
      }
    end

    let(:instance) do
      RoomingListResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { RoomingList.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:rooming_list) { create(:rooming_list) }

    let(:payload) do
      {
        data: {
          id: rooming_list.id.to_s,
          type: 'rooming_lists',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      RoomingListResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { rooming_list.reload.updated_at }
      # .and change { rooming_list.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:rooming_list) { create(:rooming_list) }

    let(:instance) do
      RoomingListResource.find(id: rooming_list.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { RoomingList.count }.by(-1)
    end
  end
end
