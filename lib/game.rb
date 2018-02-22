require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    board.full?
  end

  def won?
    winner = WIN_COMBINATIONS.select do |combo|
      if board.cells[combo[0]] == board.cells[combo[1]] &&
        board.cells[combo[1]] == board.cells[combo[2]] &&
        board.taken?(combo[0])
      end
    end

    case winner.count
    when 0
      nil
    when 1
      winner.flatten
    else
      winner.detect{|combo| combo[0] == "X"}
    end
  end

  def winner

  end

  def start

  end

  def play

  end

  def turn

  end

end
