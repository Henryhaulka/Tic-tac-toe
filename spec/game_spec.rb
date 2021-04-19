require './bin/main'
describe Player do 
    describe '#name_check' do
    player = Player.new
        it " if player's name is blank" do
            expect(player.name_check("")).to eql(false)
        end
    end
end
describe Game do
  describe '#user1_turn' do
    v = gets.chomp
    it "checks if the moves are between 1-9 on the board" do
      expect(v.to_i.between?(1, 9)).to eql(false)
    end
  end
end

