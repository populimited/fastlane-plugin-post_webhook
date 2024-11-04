describe Fastlane::Actions::PostWebhookAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The post_webhook plugin is working!")

      Fastlane::Actions::PostWebhookAction.run(nil)
    end
  end
end
