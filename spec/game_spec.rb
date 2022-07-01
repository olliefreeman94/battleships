require "game"

RSpec.describe Game do
  before(:example) do
    @list = double :ship_list
    @board = double :board, rows: 10, cols: 10
    @game = Game.new(@list, @board)
  end

  describe "game setup" do
    context "initially" do
      it "returns list of unplaced ships" do
        expect(@list).to receive(:unplaced).and_return ["SSSSS", "SSSS", "SSS", "SS"]
        expect( @game.unplaced_ships ).to eq ["SSSSS", "SSSS", "SSS", "SS"]
      end

      it "returns number of rows and columns" do
        expect( @game.rows ).to eq 10
        expect( @game.cols ).to eq 10
      end

      it "returns empty board" do
        expect(@board).to receive(:board).and_return(
          [
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
        )
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
          expect(@list).to receive(:place).with(2)
          expect(@board).to receive(:update).with("S", 1, 1)
          expect(@board).to receive(:update).with("S", 2, 1)
          @game.place_ship(
            length: 2,
            orientation: :horizontal,
            row: 1,
            col: 1
          )
        end

        it "returns updated list of unplaced ships" do
          expect(@list).to receive(:unplaced).and_return ["SSSSS", "SSSS", "SSS"]
          expect( @game.unplaced_ships ).to eq ["SSSSS", "SSSS", "SSS"]
        end

        it "returns updated board" do
          expect(@board).to receive(:board).and_return(
            [
            "SS........", 
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
          )
          expect( @game.board ).to eq [
          "SS........", 
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
      end

      context "after a ship has been placed vertically on the board" do
        before(:example) do
          expect(@list).to receive(:place).with(2)
          expect(@board).to receive(:update).with("S", 1, 1)
          expect(@board).to receive(:update).with("S", 1, 2)
          @game.place_ship(
            length: 2,
            orientation: :vertical,
            row: 1,
            col: 1
          )
        end

        it "returns updated board" do
          expect(@board).to receive(:board).and_return(
            [
            "S.........", 
            "S.........",
            "..........",
            "..........",
            "..........",
            "..........",
            "..........",
            "..........",
            "..........",
            ".........."
          ]
          )
          expect( @game.board ).to eq [
          "S.........", 
          "S.........",
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
      end
    end
  end

  describe "checking board for ships" do
    before(:example) do
      expect(@list).to receive(:place).with(2)
      expect(@board).to receive(:update).with("S", 1, 1)
      expect(@board).to receive(:update).with("S", 2, 1)
      @game.place_ship(
            length: 2,
            orientation: :horizontal,
            row: 1,
            col: 1
          )
      allow(@board).to receive(:board).and_return(
        [
        "SS........", 
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