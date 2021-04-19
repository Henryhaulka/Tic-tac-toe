#!/usr/bin/env ruby
require_relative '../lib/logic'
require_relative '../lib/player'
class Game
  attr_reader :player1_choices, :player2_choices

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
    checked_name = false
    while checked_name == false
      @player1 = gets.chomp.upcase.strip
      checked_name = Player.new.name_check(@player1)
      p 'Player name should not be blank' if checked_name == false
    end
    puts 'type the name of the 2nd player'
    checked_name = false
    while checked_name == false
      @player2 = gets.chomp.upcase.strip
      checked_name = Player.new.name_check(@player2)
      puts 'Player name should not be blank' if checked_name == false
    end
    while @player1 == @player2 && @player2 != ''
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
    puts "Choose a number from this set #{@choices.join(' ')}"
  end

  def run_turns
    # system('clear')
    game_on = true
    i = 0
    checker2 = []
    while game_on

      user1_turn
      i += 1
      checker1 = Logic.new.win_combination1(@player1_choices)
      winner_checker = Logic.new.win_checker(checker1, checker2)
      if winner_checker == true
        puts "#{@player1} is the winner"
        break
      end
      if i == 9
        puts "it's  a TIE"
        break
      end
      user2_turn
      i += 1
      checker2 = Logic.new.win_combination2(@player2_choices)
      winner_checker = Logic.new.win_checker(checker1, checker2)
      next unless winner_checker == true

      puts "#{@player2} is the winner"
      break
    end
  end

  def run_game
    draw_board
    use_data
    run_turns
  end
end
=begin
p = Game.new
p.run_game
puts 'GAME over'
=end
