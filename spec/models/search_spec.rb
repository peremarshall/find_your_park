require "rails_helper"

RSpec.describe Search, :type => :model do
  
  before(:suite) do
    @search = create(:search, :with_certain_criteria)
  end
  
  it "is valid with valid attributes" do
    search = build(:search, :with_different_criteria)
    expect(search).to be_valid
  end

  it "is not valid without a searchable type" do
    search = build(:search, :with_different_criteria, searchable_type: nil)
    expect(search).to_not be_valid
  end

  it "is not valid without criteria" do
    search = build(:search, criteria: nil)
    expect(search).to_not be_valid
  end

  it "must have unique criteria" do
    search = build(:search, :with_certain_criteria)
    expect(search).to_not be_valid
  end
end
