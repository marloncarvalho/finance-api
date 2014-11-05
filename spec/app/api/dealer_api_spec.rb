require 'spec_helper'
require 'rack/test'

describe API::DealerAPI do
  include Rack::Test::Methods

  def app
    API::APIv1
  end

  describe "GET /v1/dealer/all" do
    it "returns an empty array of dealers" do
      get "/v1/dealer/all"
      last_response.status.should == 200
    end
  end

end