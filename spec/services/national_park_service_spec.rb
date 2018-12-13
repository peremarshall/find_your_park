require 'rails_helper'

RSpec.describe NationalParkService::Client do
  before(:each) do
    stub_request(:get, "https://developer.nps.gov/api/v1/parks?api_key=TEST&limit=1000").
         to_return(status: 200, body: File.open("./spec/responses/parks.json"), headers: {})
  end

  it 'connects to the NPS API' do

    nps_client = NationalParkService::Client.new(api_key: "TEST")
    parks = nps_client.retrieve_parks
    expect(true).to eq true
  end
end
