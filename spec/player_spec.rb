#connect_four/spec/player_spec.rb

require_relative "../lib/connect_four/player.rb"

module ConnectFour
    describe Player do

        context "#initialize" do
            subject(:player) { described_class.new('bob', 'red')}

            it "Creates a player with a given name" do
                expect(player.name).to eql 'bob'
            end
        end
    end
end