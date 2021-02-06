#lib/connect_four/player.rb

module ConnectFour
    class Player
        attr_reader :name
        attr_accessor :color

        def initialize(name, color)
            @name = name
            @color = color
        end
    end
end