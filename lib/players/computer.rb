module Players
  class Computer < Player
    attr_reader :board

    WIN_COMBINATIONS = [
      [1,2,3],
      [4,5,6],
      [7,8,9],
      [1,4,7],
      [2,5,8],
      [3,6,9],
      [1,5,9],
      [7,5,3]
    ]

    BIFURCATE_COMBINATIONS = [
      [1,2,4],
      [2,3,6],
      [4,7,8],
      [6,8,9],
      [1,5,7],
      [3,5,9],
      [1,3,5],
      [5,7,9],
      [1,3,9],
      [3,7,9],
      [1,7,9],
      [1,3,7]
    ]

    def move(board)
      @board = board
      if win
        return win
      elsif block
        return block
      elsif bifurcate
        return bifurcate
      elsif block_bifurcate
        return block_bifurcate
      elsif center
        return center
      elsif opposite_corner
        return opposite_corner
      elsif corner
        return corner
      else
        side
      end
    end

    def center
      board.taken?(5) ? false : "5"
    end

    def opposite_corner
      if board.position[1] != token && !board.taken?(9)
        "9"
      elsif board.position[3] != token && !board.taken?(7)
        "7"
      elsif board.position[7] != token && !board.taken?(3)
        "3"
      elsif board.position[9] != token && !board.taken?(1)
        "1"
      else
        false
      end
    end

    def corner
      if !board.taken?(1)
        "1"
      elsif !board.taken?(3)
        "3"
      elsif !board.taken?(7)
        "7"
      elsif !board.taken?(9)
        "9"
      else
        false
      end
    end

    def side
      if !board.taken?(2)
        "2"
      elsif !board.taken?(4)
        "4"
      elsif !board.taken?(6)
        "6"
      elsif !board.taken?(8)
        "8"
      else
        false
      end
    end

    def bifurcate
      bifurcate = BIFURCATE_COMBINATIONS.detect do |combo|
                board.position[combo[0]] == board.position[combo[1]] &&
                board.position[combo[2]] == " " &&
                board.position[combo[0]] != " " &&
                board.position[combo[0]] == token
              end
      bifurcate2 = BIFURCATE_COMBINATIONS.detect do |combo|
                board.position[combo[1]] == board.position[combo[2]] &&
                board.position[combo[0]] == " " &&
                board.position[combo[1]] != " " &&
                board.position[combo[1]] == token
              end
      bifurcate3 = BIFURCATE_COMBINATIONS.detect do |combo|
                board.position[combo[2]] == board.position[combo[0]] &&
                board.position[combo[1]] == " " &&
                board.position[combo[2]] != " " &&
                board.position[combo[2]] == token
              end

      if bifurcate
        bifurcate[2]
      elsif bifurcate2
        bifurcate2[0]
      elsif bifurcate3
        bifurcate3[1]
      else
        false
      end
    end

    def block_bifurcate
      block_bifurcate = BIFURCATE_COMBINATIONS.detect do |combo|
                board.position[combo[0]] == board.position[combo[1]] &&
                board.position[combo[2]] == " " &&
                board.position[combo[0]] != " " &&
                board.position[combo[0]] != token
              end
      block_bifurcate2 = BIFURCATE_COMBINATIONS.detect do |combo|
                board.position[combo[1]] == board.position[combo[2]] &&
                board.position[combo[0]] == " " &&
                board.position[combo[1]] != " " &&
                board.position[combo[1]] != token
              end
      block_bifurcate3 = BIFURCATE_COMBINATIONS.detect do |combo|
                board.position[combo[2]] == board.position[combo[0]] &&
                board.position[combo[1]] == " " &&
                board.position[combo[2]] != " " &&
                board.position[combo[2]] != token
              end

      if block_bifurcate
        block_bifurcate[2]
      elsif block_bifurcate2
        block_bifurcate2[0]
      elsif block_bifurcate3
        block_bifurcate3[1]
      else
        false
      end
    end

    def block
      block = WIN_COMBINATIONS.detect do |combo|
                board.position[combo[0]] == board.position[combo[1]] &&
                board.position[combo[2]] == " " &&
                board.position[combo[0]] != " " &&
                board.position[combo[0]] != token
              end
      block2 = WIN_COMBINATIONS.detect do |combo|
                board.position[combo[1]] == board.position[combo[2]] &&
                board.position[combo[0]] == " " &&
                board.position[combo[1]] != " " &&
                board.position[combo[1]] != token
              end
      block3 = WIN_COMBINATIONS.detect do |combo|
                board.position[combo[2]] == board.position[combo[0]] &&
                board.position[combo[1]] == " " &&
                board.position[combo[2]] != " " &&
                board.position[combo[2]] != token
              end

      if block
        block[2]
      elsif block2
        block2[0]
      elsif block3
        block3[1]
      else
        false
      end
    end

    def win
      winner = WIN_COMBINATIONS.detect do |combo|
                board.position[combo[0]] == board.position[combo[1]] &&
                board.position[combo[2]] == " " &&
                board.position[combo[0]] != " " &&
                board.position[combo[0]] == token
              end
      winner2 = WIN_COMBINATIONS.detect do |combo|
                board.position[combo[1]] == board.position[combo[2]] &&
                board.position[combo[0]] == " " &&
                board.position[combo[1]] != " " &&
                board.position[combo[1]] == token
              end
      winner3 = WIN_COMBINATIONS.detect do |combo|
                board.position[combo[2]] == board.position[combo[0]] &&
                board.position[combo[1]] == " " &&
                board.position[combo[2]] != " " &&
                board.position[combo[2]] == token
              end

      if winner
        winner[2]
      elsif winner2
        winner2[0]
      elsif winner3
        winner3[1]
      else
        false
      end
    end
  end
end
