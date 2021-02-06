#lib/connect_four/game.rb

require_relative "./player.rb"
require_relative "./board.rb"
require_relative "./core_extensions.rb"

module ConnectFour
    class Game
        attr_reader :players, :current_player, :other_player, :board
        def initialize(players, board = Board.new)
            @players = players
            @board = board
            @current_player, @other_player = players.shuffle
        end

        def switch_players
            @current_player, @other_player = @other_player, @current_player
        end
        
        def solicit_move
            "#{current_player.name.bold}: choose where to drop your piece (1-7)"
        end

        def get_move(move = gets.chomp.to_i)
            until move.between?(1, 7)
                puts "Please enter a number between 1-7."
                move = gets.chomp.to_i
            end
            move -= 1
        end

        def game_over_message
			return "#{current_player.name} won!".bold if board.game_over == :winner
			return "The game ended in a tie!".bold if board.game_over == :draw
        end
        
        def play
			puts "\n#{current_player.name.bold} has randomly been selected as the first player.\n"
			while true
				board.formatted_grid
				puts ""
				puts solicit_move
				move = get_move
				board.drop_token(move, current_player.color)
				if board.game_over
					puts game_over_message
					board.formatted_grid
					return
				else
					switch_players
				end
			end
		end
    end
end