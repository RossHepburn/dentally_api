RSpec.describe DentallyApi do
  it "has a version number" do
    expect(DentallyApi::VERSION).not_to be nil
  end

  API_PARAMS =
    {
      host: "http://api.rails.local:3000",
      access_token: "2c0261bed7e64af85016a7c3c87eaa51ea13dbda9349a30404dfd4281a6b8b10"
  }.freeze

  let(:client) { DentallyApi.new(API_PARAMS) }

  it "instantiates the class with named arguments" do
    expect { client }.not_to raise_error
  end

  it "practice" do
    expect(client.practice).not_to be_nil
    expect(client.errors).to be_empty
  end
end
