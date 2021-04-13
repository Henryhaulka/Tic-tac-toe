#!/usr/bin/env ruby
class Game
  def initialize()
    @player1 = ''
    @player2 = ''
    @players = {}
    @choices = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @player1_choices = []
    @player2_choices = []
  end

  def draw_board
    puts '+---+---+---+'
    puts "| #{@choices[0]} | #{@choices[1]} | #{@choices[2]} |"
    puts '+---+---+---+'
    puts "| #{@choices[3]} | #{@choices[4]} | #{@choices[5]} |"
    puts '+---+---+---+'
    puts "| #{@choices[6]} | #{@choices[7]} | #{@choices[8]} |"
    puts '+---+---+---+'
  end

  def use_data
    puts "Welcome to Ruby's tic tac toe"
    puts 'type the name of the 1st player'
    @player1 = gets.chomp.upcase.strip
    until @player1 != ''
      puts 'Player name should not be blank'
      @player1 = gets.chomp.strip
    end
    puts 'type the name of the 2nd player'
    @player2 = gets.chomp.upcase.strip
    until @player2 != ''
      puts 'Player name should not be blank'
      @player2 = gets.chomp.upcase.strip
    end
    while @player1 == @player2
      puts "Player names should not be the same, #{@player2} put another name"
      @player2 = gets.chomp.upcase.strip
    end

    @players = { @player1 => 'x', @player2 => 'o' }
    puts "#{@player1} will use X and #{@player2} will use O "
  end

  def user1_turn
    puts "its #{@player1}'s turn"
    v = gets.chomp
    until v.to_i.between?(1, 9)
      puts 'please pick a choice between 1 and 9'
      v = gets.chomp
    end

    while @player1_choices.include? v.to_i or @player2_choices.include? v.to_i
      puts 'cell has ben taken, select an available cell from the board (1 -9)'
      v = gets.chomp
    end

    @choices[v.to_i - 1] = 'Y'
    puts draw_board
    @player1_choices.push(v.to_i)
    @choices.delete((@choices.index(v.to_i - 1)))
    puts "Choose a number from this set #{@choices.join(' ')}"
  end

  def user2_turn
    puts "its #{@player2}'s turn"
    v = gets.chomp
    until v.to_i.between?(1, 9)
      puts 'please pick a choice between 1 and 9'
      v = gets.chomp
    end
    while @player1_choices.include? v.to_i or @player2_choices.include? v.to_i
      puts 'cell has ben taken, select an available cell from the board (1 -9)'
      v = gets.chomp
    end
    @choices[v.to_i - 1] = 'X'
    draw_board
    @player2_choices.push(v.to_i)
    @choices.delete((@choices.index(v.to_i - 1)))
    puts "Choose a number from this set #{@choices.join(' ')}"
  end

  def run_turns
    system('clear')
    game_on = true
    i = 0
    while game_on && i <= 7
      user1_turn
      user2_turn
      i += 2
    end
    if 
    game_on = false
  end

    puts "it's a DRAW"
    puts ''
    puts "#{@player1} is the  WINNER!!!"
    puts ''
    puts "Better luck next time  #{@player2}"

    puts 'GAME OVER!!!'
  end

  def run_game
    draw_board
    use_data
    run_turns
  end
end

p = Game.new
p.run_game
