require './bin/main'
describe Player do 
    describe '#name_check' do
    player = Player.new
        it " if player's name is blank" do
            expect(player.name_check("")).to eql(false)
        end
    end
end