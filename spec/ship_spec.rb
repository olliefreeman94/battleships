require "ship"

RSpec.describe Ship do
  before(:example) do
    @ship = Ship.new(4)
    expect( @ship.length ).to eq 4
  end

  it "constructs ship as unplaced" do
    expect( @ship.placed? ).to eq false
  end

  context "when ship has been placed" do
    before(:example) do
      @ship.place
    end
    
    it "records ship as placed" do
      expect( @ship.placed? ).to eq true
    end
  end
end