describe Fastlane::Actions::PostWebhookAction do
  describe '#run' do
    it 'correctly triggers a generic webhook' do
      # Since this is a single test we can avoid stubbing the HTTP
      # request and just perform it straight away.
      params = {
        url: 'https://httpbin.org/post', api_key: 'some_api_key',
        body: { 'key' => 'value' }
      }
      result = Fastlane::Actions::PostWebhookAction.run(params)

      expected_result = {
        'status' => 200,
        'response_body' => {
          'args' => {},
          'data' => "{\"key\":\"value\"}",
          'files' => {},
          'form' => {},
          'headers' => {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Authorization' => 'Bearer some_api_key',
            'Content-Length' => '15',
            'Content-Type' => 'application/json',
            'Host' => 'httpbin.org',
            'User-Agent' => 'Ruby',
            'X-Amzn-Trace-Id' => a_kind_of(String)
          },
          'json' => { "key" => "value" },
          'origin' => a_kind_of(String),
          'url' => 'https://httpbin.org/post'
        }
      }

      expect(result).to match(expected_result)
    end
  end
end
