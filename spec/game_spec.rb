require "game"

RSpec.describe Game do
  before(:example) do
    @game = Game.new
  end

  describe "game setup" do
    context "initially" do
      it "returns list of unplaced ships" do
        expect( @game.unplaced_ships ).to eq ["SSSSS", "SSSS", "SSS", "SSS", "SS"]
      end

      it "returns number of rows and columns" do
        expect( @game.rows ).to eq 10
        expect( @game.cols ).to eq 10
      end

      it "returns empty board" do
        expect( @game.board ).to eq [
          "..........", 
          "..........",
          "..........",
          "..........",
          "..........",
          "..........",
          "..........",
          "..........",
          "..........",
          ".........."
        ]
      end

      context "after a ship has been placed horiztontally on the board" do
        before(:example) do
          @game.place_ship(
            length: 2,
            orientation: :horizontal,
            row: 1,
            col: 1
          )
        end

        it "returns updated list of unplaced ships" do
          expect( @game.unplaced_ships ).to eq ["SSSSS", "SSSS", "SSS", "SSS"]
        end

        it "returns updated board" do
          expect( @game.board ).to eq [
          "..........", 
          "..........",
          "..........",
          "..........",
          "..........",
          "..........",
          "..........",
          "..........",
          "..........",
          "SS........"
        ]
        end
      end

      context "after a ship has been placed vertically on the board" do
        before(:example) do
          @game.place_ship(
            length: 2,
            orientation: :vertical,
            row: 1,
            col: 1
          )
        end

        it "returns updated board" do
          expect( @game.board ).to eq [
          "..........", 
          "..........",
          "..........",
          "..........",
          "..........",
          "..........",
          "..........",
          "..........",
          "S.........",
          "S........."
        ]
        end
      end
    end
  end

  describe "checking board for ships" do
    before(:example) do
      @game.place_ship(
            length: 2,
            orientation: :horizontal,
            row: 1,
            col: 1
          )
    end

    it "returns true when checked board location contains ship" do
      expect( @game.ship_at?(1, 1) ).to eq true
      expect( @game.ship_at?(2, 1) ).to eq true
    end

    it "returns false when checked board location does not contain ship" do
      expect( @game.ship_at?(1, 2) ).to eq false
      expect( @game.ship_at?(3, 1) ).to eq false
    end
  end
end