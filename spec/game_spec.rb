#connect_four/spec/game_spec.rb
require_relative "../lib/connect_four/game.rb"

module ConnectFour
    describe Game do
        let(:bob) { Player.new('bob', 'red') }
        let(:frank) { Player.new('frank', 'black')}
        subject(:game) { described_class.new([bob, frank]) }

        before do
            allow_any_instance_of(Array).to receive(:shuffle).and_return([frank, bob])
        end
        
        context "initialize" do

            it "selects a random player" do
                expect(game.current_player).to eql frank
            end

        end

        context "#switch_players" do
            it "sets @current_player to @other_player" do
				other_player = game.other_player
				game.switch_players
				expect(game.current_player).to eq other_player
			end

			it "sets @other_player to @current_player" do
				current_player = game.current_player
				game.switch_players
				expect(game.other_player).to eq current_player
			end
        end

        context "#solicit_move" do
            it "asks the current player for their move" do
                expected = "frank: choose where to drop your piece (1-7)" 
                expect(game.solicit_move).to eql expected
            end
        end

        context "#get_move" do
            it "converts player number to column number" do
                expect(game.get_move(3)).to eql 2
            end
        end

        context "#game_over_message" do
            it "displays 'current_player won!' if board shows a winner" do
                allow(game.board).to receive(:game_over).and_return(:winner)
				expect(game.game_over_message).to eq "frank won!"
			end

			it "returns 'The game ended in a tie' if board shows a draw" do
				allow(game.board).to receive(:game_over).and_return(:draw)
				expect(game.game_over_message).to eq "The game ended in a tie!"
			end
		end 
    end
end