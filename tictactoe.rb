#!/usr/bin/env ruby

class TicTacToe

  attr_accessor :b
  attr_accessor :turn
  attr_accessor :winner

  def initialize
    self.b = [['-', '-', '-'], ['-', '-', '-'], ['-', '-', '-']]
    self.turn = 'X'
    clear
    draw
    get_move
  end

  def get_move
    print "Player #{turn} move [row,col]? "
    r, c = gets.chomp.split(',')
    add_token(r.to_i, c.to_i)
    draw
    if game_over
      puts "Winner is #{winner}!"
    else
      get_move
    end
  end

  def draw
    clear
    out = ''
    b.each do |r|
      r.each_with_index do |c, index|
        out << c
        out << '|' if [0, 1].include?(index)
        out << "\n" if index == 2
      end
    end
    puts "#{out}\n"
  end

  def add_token(row, col)
    if b[row][col] == '-'
      b[row][col] = turn
      self.turn = turn == 'X' ? 'O' : 'X'
    end
  end

  def clear
    system('clear')
  end

  def game_over
    # check rows
    (0..2).each do |r|
      if b[r][0] != '-' && b[r][0] == b[r][1] && b[r][0] == b[r][2]
        self.winner = b[r][0]
        return true
      end
    end

    # check cols
    (0..2).each do |c|
      if b[0][c] != '-' && b[0][c] == b[1][c] && b[0][c] == b[2][c]
        self.winner = b[0][c]
        return true
      end
    end

    # check diagonals
    if b[0][0] != '-' && b[0][0] == b[1][1] && b[0][0] == b[2][2]
      self.winner = b[0][0]
      return true
    end
    if b[2][0] != '-' && b[2][0] == b[1][1] && b[2][0] == b[0][2]
      self.winner = b[2][0]
      return true
    end

    false
  end
end

TicTacToe.new
