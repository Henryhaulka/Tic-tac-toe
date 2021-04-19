require_relative '../bin/main'
describe Player do 
    describe '#name_check' do
    it " if player's name is blank" do
        expect(Player.name_check(" ")). to eql(false)
    end
    it "if player's name is not blank" do
        #  expect(Player.name_check("henry")). to eql(true)
    end
end
end