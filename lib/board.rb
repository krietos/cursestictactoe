require('./lib/space.rb')
class Board
  @@spaces = []
  def spaces
    @@spaces
  end

  def Board.create
    new_board = Board.new()
  end

  def initialize
    for i in 1..3
      for j in 1..3
        new_space = Space.create(i, j)
        @@spaces << new_space
      end
    end
  end

  def find(x, y)
    @@spaces.each do | val |
      if val.x == x && val.y == y
        return val
      end
    end
  end

  def Board.clear
    @@spaces = []
  end

  def winner
    i = 0
    while i <= 6 do
      if @@spaces[i].marked_by == @@spaces[i+1].marked_by && @@spaces[i].marked_by == @@spaces[i+2].marked_by
        if @@spaces[i].marked_by != :unmarked
          return @@spaces[i].marked_by
        end
      end
      i += 3
    end
    for j in 0..2
      if @@spaces[j].marked_by == @@spaces[j+3].marked_by && @@spaces[j].marked_by == @@spaces[j+6].marked_by
        if @@spaces[j].marked_by != :unmarked
          return @@spaces[j].marked_by
        end
      end
    end
    if (@@spaces[0].marked_by == @@spaces[4].marked_by && @@spaces[0].marked_by == @@spaces[8].marked_by) ||
       (@@spaces[2].marked_by == @@spaces[4].marked_by && @@spaces[2].marked_by == @@spaces[6].marked_by )
      if @@spaces[4].marked_by != :unmarked
        return @@spaces[0].marked_by
      end
    end
    return "no winner"
  end
end
