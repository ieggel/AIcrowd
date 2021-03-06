require 'rails_helper'

RSpec.describe NotificationService do
  let!(:participant) { create :participant }

  context 'comment' do
    let!(:comment) { create :comment }

    it 'creates a notification' do
      expect do
        described_class.new(participant.id, comment, 'comment').call
      end.to change(Notification, :count).by(1)
    end
  end

  context 'mention' do
    let!(:comment) { create :comment }

    it 'creates a notification' do
      expect do
        described_class.new(participant.id, comment, 'mention').call
      end.to change(Notification, :count).by(1)
    end
  end
end
