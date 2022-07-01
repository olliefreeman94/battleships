require "ship_list"

RSpec.describe ShipList do
  before(:example) do
    @ships = ShipList.new
    @carrier = double :ship, length: 5
    @battleship = double :ship, length: 4
    @cruiser = double :ship, length: 3
    @destroyer = double :ship, length: 2
    @ships.add(@carrier)
    @ships.add(@battleship)
    @ships.add(@cruiser)
    @ships.add(@destroyer)
  end

  describe "game setup" do
    before(:example) do
      allow(@carrier).to receive(:placed?).and_return(false)
      allow(@battleship).to receive(:placed?).and_return(false)
      allow(@cruiser).to receive(:placed?).and_return(false)
      allow(@destroyer).to receive(:placed?).and_return(false)
    end

    context "initially" do
      it "returns formatted list of unplaced ships" do
        expect( @ships.unplaced ).to eq ["SSSSS", "SSSS", "SSS", "SS"]
      end
    end

    context "after ship has been placed on board" do
      before(:example) do
        expect(@carrier).to receive(:place)
        @ships.place(5)
        expect(@carrier).to receive(:placed?).and_return(true)
      end
      
      it "returns updated formatted list of unplaced ships" do
        expect( @ships.unplaced ).to eq ["SSSS", "SSS", "SS"]
      end
    end
  end
end