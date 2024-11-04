require 'fastlane/action'
require_relative '../helper/post_webhook_helper'

module Fastlane
  module Actions
    class PostWebhookAction < Action
      def self.run(params)
        UI.message("The post_webhook plugin is working!")
      end

      def self.description
        "Triggers a webhook of a generic URL"
      end

      def self.authors
        ["Lorenzo Zabot"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Triggers a webhook of a generic URL, given the URL, an api_key and a JSON body"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "POST_WEBHOOK_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
