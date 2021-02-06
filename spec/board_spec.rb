require '../lib/connect_four/board.rb'

module ConnectFour

    describe Board do
        

        context "#initialize" do
            subject(:board) { described_class.new }
            it "creates a grid" do
                expect(board.grid).to_not be_nil
            end

            it "initializes the grid with 7 columns" do
                expect(board.grid.length).to eq 7
            end

            it "initializes the grid with 6 rows" do
                expect(board.grid.transpose.length).to eq 6
            end
        end

        context "#set_cell" do
            subject(:board) { described_class.new }

            it "sets the value of cell at column X row Y to chosen input" do
                column = 0
                row = 5
                chosen_input = 'red'
                board.set_cell(column, row, chosen_input)
                expect(board.grid[column][row].value).to eq 'red'
            end
        end

        context "#drop_token(column, color)" do
            subject(:board) { described_class.new }
            it "sets the value of the first available cell in the chosen column to the chosen color" do
                
                #putting a red token in the end of the first column
                board.set_cell(0, 5, 'red')
                board.drop_token(0, 'black')
                expect(board.grid[0][4].value).to eql 'black'
            end

            it "returns column_full if the column is full" do
                6.times do 
                    board.drop_token(1, 'red')
                end
                expect(board.drop_token(1, 'red')).to eql "The column is full!"
            end
        end

        context "#game_over" do
            it "returns :winner if the game is over and there is a winner" do
                board = Board.new
                allow(board).to receive(:winner?).and_return(true)
                expect(board.game_over).to eql :winner
            end
            it "returns :draw if the board is full and there is no winner" do
                board = Board.new
                allow(board).to receive(:winner?).and_return(false)
                allow(board).to receive(:draw?).and_return(true)
                expect(board.game_over).to eql :draw
            end
            it "returns false is there is no winner and the board is not full" do
                board = Board.new
                allow(board).to receive(:winner?).and_return(false)
                allow(board).to receive(:draw?).and_return(false)
                expect(board.game_over).to eql false
            end

            it "returns :winner when there are 4 same-color tokens in a horizontal row" do
                board = Board.new
                board.drop_token(0, 'red')
                board.drop_token(1, 'red')
                board.drop_token(2, 'red')
                board.drop_token(3, 'red')
                expect(board.game_over).to eql :winner
            end

            it "returns :winner when there are 4 same-color tokens in a vertical row" do
                board = Board.new
                board.drop_token(0, 'red')
                board.drop_token(0, 'red')
                board.drop_token(0, 'red')
                board.drop_token(0, 'red')
                expect(board.game_over).to eql :winner 
            end

            it "returns :winner when there are 4 same-color tokens in a diagonal" do
                board = Board.new
                board.drop_token(0, 'red')
                board.drop_token(1, 'test')
                board.drop_token(1, 'red')
                board.drop_token(2, 'test')
                board.drop_token(2, 'test')
                board.drop_token(2, 'red')
                board.drop_token(3, 'test')
                board.drop_token(3, 'test')
                board.drop_token(3, 'test')
                board.drop_token(3, 'red')
                expect(board.game_over).to eql :winner
            end

            it "returns :draw when the board is full and there is no winner" do
                board = Board.new
                7.times do |column|
                    6.times do |row|
                        board.drop_token(column, 'test')
                    end
                end
                expect(board.game_over).to eql :draw
            end
        end
    end
end



