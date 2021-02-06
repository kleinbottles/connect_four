#spec/cell_spec.rb
require "../lib/connect_four/cell.rb"

module ConnectFour
    describe Cell do

        context "#initialize" do
            it "Creates a cell with a value of '' by default" do
                cell = Cell.new
                expect(cell.value).to eq ''
            end

            it "Can be set with a value" do
                red_cell = Cell.new("red")
                expect(red_cell.value).to eq 'red'
            end
        end
    end
end