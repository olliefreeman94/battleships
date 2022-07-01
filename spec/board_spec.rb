require "board"

RSpec.describe Board do
  before(:example) do
    @board = Board.new(10, 10)
  end

  describe "game setup" do
    context "initially" do
      it "returns an empty board" do
        expect( @board.rows ).to eq 10
        expect( @board.cols ).to eq 10
        expect( @board.board ).to eq [
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
    end

    context "after ship has been placed on board" do
      before(:example) do
        @board.update("S", 2, 2)
        @board.update("S", 2, 3)
      end
    
      it "records ship at that location" do
        expect( @board.board ).to eq [
          "..........", 
          "..........",
          "..S.......",
          "..S.......",
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