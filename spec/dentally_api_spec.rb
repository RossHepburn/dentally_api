RSpec.describe DentallyApi do
  it "has a version number" do
    expect(DentallyApi::VERSION).not_to be nil
  end

  API_PARAMS =
    {
      client_id: "f4cdfd450cc1139fb71d8dbf1342fb512e5e9ca507be6a79cf454fbe3a75fd73",
      redirect_uri: "https://example.com/callback",
      scope: "appointment patient:read patient:update user:read",
      response_type: "code",
      state: "914e62ad35e7aa8a14f46bf8aff9194b24b7f6d7c5a434a7"
    }

  describe "Initialisation" do

    it "instantiates the class with named arguments" do
      expect { DentallyApi.new(API_PARAMS) }.not_to raise_error
    end

    it "instantiates the class without optional arguments" do
      non_optional = API_PARAMS.dup
      non_optional.delete(:state)
      expect { DentallyApi.new(non_optional) }.not_to raise_error
    end
  end
end
