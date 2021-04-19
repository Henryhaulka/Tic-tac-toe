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
      expect(v.to_i.between?(1, 9)).to eq(false)
    end
    it "checks if the cell has been taken" do
      @player1_choices = []
      @player2_choices = []
      expect(@player1_choices.include? v.to_i).to eq(false)
      expect(@player2_choices.include? v.to_i).to eq(false)
    end
  end
   describe '#user2_turn' do
    v = gets.chomp
    it "checks if the moves are between 1-9 on the board" do
      expect(v.to_i.between?(1, 9)).to eq(false)
    end
    it "checks if the cell has been taken" do
      @player1_choices = []
      @player2_choices = []
      expect(@player1_choices.include? v.to_i).to eq(false)
      expect(@player2_choices.include? v.to_i).to eq(false)
    end
  end
end

describe Logic do
  checker = Logic.new
  describe '#win_combination' do
    it 'returns an array without elements' do
      player1_choices = [2, 4, 7, 8]
      expect(checker.win_combination1(player1_choices)).to eql([])
    end

    it 'returns an array with matching winning combination' do
      player1_choices = [1, 3, 4, 2]
      expect(checker.win_combination1(player1_choices)).to eql([[1, 2, 3]])
    end
  end
end



