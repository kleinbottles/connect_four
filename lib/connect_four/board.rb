#lib/connect_four/board.rb
require_relative "../connect_four/cell.rb"
require_relative "../connect_four/core_extensions.rb"

module ConnectFour
    class Board
        attr_reader :grid

        def initialize
            @grid = default_grid
        end

        def set_cell(column, row, color)
            grid[column][row].value = color
        end

        def drop_token(column, color)
            queue = grid[column]
            row = 5
            while row >= 0
                return set_cell(column, row, color) if queue[row].value == 'blank'
                row -= 1
            end
            column_full
        end

        def column_full
            "The column is full!"
        end

        def game_over
            return :winner if winner?
            return :draw if draw?
            false
        end

        def formatted_grid
            puts "1 2 3 4 5 6 7"
			grid.transpose.each do |row|
				puts row.map { |cell| cell.value == 'blank' ? "_" : cell.format }.join(" ")
			end
		end
        
        private

        #the default grid consists of 6 rows and 7 columns. 
        def default_grid
            Array.new(7) { Array.new(6) { Cell.new } }
        end

        def winner?
            red_win = "redredredred"
            black_win = "blackblackblackblack"
            winning_positions.each do |winning_position|
                to_check = winning_position_values(winning_position)
				next if to_check.all?('blank')
                if to_check.join('').include?(red_win) || to_check.join('').include?(black_win)
                    return true
                end
			end
			false
        end

        def winning_positions
            grid + grid.transpose + diagonal_up + diagonal_down
        end

        def winning_position_values(winning_position)
			winning_position.map { |cell| cell.value }
		end

        def diagonal_up
            padding = [*0..(grid.length - 1)].map { |column| [nil] * column}
            padded_array = padding.reverse.zip(grid).zip(padding).map(&:flatten)
            padded_array.transpose.map(&:compact)
        end

        def diagonal_down
            padding = [*0..(grid.length - 1)].map { |column| [nil] * column}
            padded_array = padding.zip(grid).zip(padding.reverse).map(&:flatten)
            padded_array.transpose.map(&:compact)
        end

        def draw?
            grid.flatten.map { |cell| cell.value }.none?("blank")
        end


       
        
       
    end
end