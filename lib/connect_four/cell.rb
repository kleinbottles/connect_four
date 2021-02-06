#lib/connect_four/cell.rb
require_relative "./core_extensions.rb"

module ConnectFour
    class Cell
        attr_accessor :value

        def initialize(value = 'blank')
            @value = value
        end

        def format
            if self.value == 'red'
               return 'O'.red
            elsif self.value == 'black'
               return 'O'
            end
            self.value
        end
    end
end
