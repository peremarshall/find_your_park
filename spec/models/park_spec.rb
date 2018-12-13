require "rails_helper"

RSpec.describe Park, :type => :model do
  
  before(:all) do
    @park = create(:park)
  end
  
  it "is valid with valid attributes" do
    expect(@park).to be_valid
  end

  it "is not valid without a name" do
    park = build(:park, name: nil)
    expect(park).to_not be_valid
  end

  it "is not valid without a description" do
    park = build(:park, description: nil)
    expect(park).to_not be_valid
  end
end
