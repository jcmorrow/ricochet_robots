require "rails_helper"

describe CreateBoard do
  describe ".run" do
    it "creates a board and persists it" do
      CreateBoard.run

      expect(Board.count).to eq(1)
    end
  end
end

describe CopyBoard do
  describe "#run" do
    it "copies the board" do
      board = create(:board)

      dupped_board = CopyBoard.run(board: board)

      expect(Board.count).to eq(2)
      expect(dupped_board.size).to eq(16)
    end
  end
end
