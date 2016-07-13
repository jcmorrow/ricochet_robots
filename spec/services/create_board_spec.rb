require "rails_helper"

describe CopyBoard do
  describe "#run" do
    it "copies the board" do
      board = create(:board)

      CopyBoard.run(board: board).save

      expect(Board.count).to eq(2)
    end
  end
end
