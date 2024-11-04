require 'fastlane/action'
require_relative '../helper/post_webhook_helper'

require "net/http"
require "uri"
require 'json'

module Fastlane
  module Actions
    class PostWebhookAction < Action
      def self.run(params)
        uri = URI.parse(params[:url])
        body = params[:body]
        api_key = params[:api_key]
        headers = {
          "Authorization" => "Bearer #{api_key}",
          "Content-Type" => "application/json"
        }

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == "https")
        response = http.post(uri.path, body.to_json, headers)

        {
          "status" => response.code.to_i,
          "response_body" => JSON.parse(response.body)
        }
      end

      def self.description
        "Triggers a webhook of a generic URL"
      end

      def self.authors
        ["Lorenzo Zabot"]
      end

      def self.return_value
        "The response body from the webhook call"
      end

      def self.details
        "Triggers a webhook of a generic URL, given the URL, an api_key and a JSON body"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :url,
                                       description: "The URL to send the POST request to",
                                       optional: false,
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :api_key,
                                       description: "The API key for authorization",
                                       optional: false,
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :body,
                                       description: "The JSON body for the POST request",
                                       optional: false,
                                       type: Hash)
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
